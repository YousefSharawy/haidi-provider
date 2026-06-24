import 'dart:async';
import 'dart:convert';
import 'package:base_flutter/customer/screens/Contact/ContactImports.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/screens/login/LoginImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import "dart:developer";
import "package:firebase_core/firebase_core.dart";

import '../../customer/models/HomeModel.dart';
import '../../customer/screens/Orders/OrdersImports.dart';
import '../../customer/screens/home/HomeImports.dart';
import '../../customer/screens/notification/NotificationsWImports.dart';
import '../MyApp.dart';
import '../blocks/auth_cubit/auth_cubit.dart';
import '../utilities/http/dio/utils/GlobalState.dart';
import '../utilities/utils_functions/Navigator.dart';
import '../utilities/utils_functions/UtilsImports.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('========= >>> backGroundMessage ${message.data}');
  log('where r u 2');
  // Nav.navigateTo(Notifications(), navigatorType: NavigatorType.push);
  // if (message.data != null || message.data != {}) {
  //   handleNotificationsTap(json.encode(message.data));
  // }
}

void requestPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}

void showNotification(RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    "sa.aait.heidiProvider",
    "haidiProvider",
    channelDescription: "haidiProvider",
    enableVibration: true,
    playSound: true,
    icon: "appicon",
    importance: Importance.high,
    priority: Priority.high,
  );
  var notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  String title = "${event.notification!.title}";
  String body = "${event.notification!.body}";
  await flutterLocalNotificationsPlugin
      .show(id: 200, title: title, body: body, notificationDetails: notificationDetails, payload: payload);
  log('========= >>> show notification title ${event.notification!.title}');
  log('========= >>> show notification body ${event.notification!.body}');
}

void initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("appicon");

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
    log('where r u 3');
    return handleNotificationsTap(response.payload);
  });
}

Future<void> registerNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

void initializeFlutterFire() async => await registerNotification();

handleNotificationsTap(String? payload) async {
  bool auth = navigationKey.currentContext!.read<AuthCubit>().state.authorized;
  log('on tab $payload');
  if (payload!.isEmpty || payload == '{}') {
    log('========= >>> null');
    Nav.navigateTo(Notifications(), navigatorType: NavigatorType.push);
  } else {
    List<String> str =
        payload.replaceAll("{", "").replaceAll("}", "").split(",");
    Map<String, dynamic> data = {};
    for (int i = 0; i < str.length; i++) {
      List<String> s = str[i].split(":");
      data.putIfAbsent(s[0].trim(), () => s[1].trim());
    }
    log('========= >>> on tab Data is $data');
    int _type = int.parse(data["type"] ?? -1);
    int _orderId = int.parse(data["orderId"] ?? 0);
    int _orderType = int.parse(data["orderType"]);
    String _body = data["body"];
    if (auth == false) {
      print(auth);
    } else {
      if (_type == -1) {
        Utils.clearSavedData();
        GlobalState.instance.set("token", "");
        Nav.navigateTo(Login(), navigatorType: NavigatorType.pushAndPopUntil);
      } else if (_type == 1 && _orderType == 0) {
        Nav.navigateTo(Orders(isMarketOrders: false),
            navigatorType: NavigatorType.push);
      } else if (_type == 1 && _orderType == 1) {
        Nav.navigateTo(Orders(isMarketOrders: true),
            navigatorType: NavigatorType.push);
      } else if (_type == 4 && _orderType == 0) {
        Nav.navigateTo(
            Orders(
              isMarketOrders: false,
              index: 2,
            ),
            navigatorType: NavigatorType.push);
        OrdersData().statusCubit.onUpdateData(3);
      } else if (_type == 4 && _orderType == 1) {
        Nav.navigateTo(
            Orders(
              isMarketOrders: true,
              index: 2,
            ),
            navigatorType: NavigatorType.push);
        OrdersData().statusCubit.onUpdateData(3);
      } else if (_type == 6 && _orderType == 0) {
        Nav.navigateTo(
            Orders(
              isMarketOrders: false,
              index: 3,
            ),
            navigatorType: NavigatorType.push);
        OrdersData().statusCubit.onUpdateData(4);
      } else if (_type == 6 && _orderType == 1) {
        Nav.navigateTo(
            Orders(
              isMarketOrders: true,
              index: 2,
            ),
            navigatorType: NavigatorType.push);
        OrdersData().statusCubit.onUpdateData(3);
      } else if (_type == 7 || _type == 8) {
        Nav.navigateTo(Notifications(), navigatorType: NavigatorType.push);
      } else {
        Nav.navigateTo(Home(), navigatorType: NavigatorType.push);
      }
      HomeData()
          .homeCubit
          .state
          .data
          ?.notificationsModel?.insert(0, NotificationModel(id: _orderId, text: _body));
      HomeData().homeCubit.onUpdateData(HomeData().homeCubit.state.data);
    }
  }
}

void saveFcmToken() async {
  try {
    var token = await FirebaseMessaging.instance.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    log("Firebase Fcm token : ${token.toString()}");
  } catch (e) {
    // FCM can fail to register (no Play Services / offline / bad config) -
    // don't let it throw an unhandled exception on startup.
    log("Firebase FCM token unavailable: $e");
  }
}

void setupNotifications(BuildContext context) async {
  saveFcmToken();
  initializeFlutterFire();
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    if (event.data != {}) {
      log("========= >>> on listen for event notification ${event.notification?.body.toString()}");
      log("========= >>> on listen for event notification ${event.notification?.title.toString()}");
      log("========= >>> on listen for event data ${event.data}");
      showNotification(event, "${event.data}");
    } else {
      showNotification(event, "${event.notification}");
    }
    HomeData().fetchHome(context);
    // Nav.navigateTo(Home(), navigatorType: NavigatorType.push);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    log('where r u 1');
    handleNotificationsTap(json.encode(event.data));
    HomeData().fetchHome(context);
    // Nav.navigateTo(Home(), navigatorType: NavigatorType.push);
  });
  log("Notifications init complete");
}