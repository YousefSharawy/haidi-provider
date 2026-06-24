import 'dart:io';

import 'package:base_flutter/general/MyApp.dart';
import 'package:flutter/cupertino.dart';
enum NavigatorType { animation, push, pushAndPopUntil }
enum AnimationType { fade, scale }

class Nav {
  // GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  // late AnimationController controller;
  static Future navigateTo<T>(
      Widget navigateTo, {
        required NavigatorType navigatorType,
        AnimationType animationType = AnimationType.fade,
        Duration duration = const Duration(milliseconds: 600),
      }) async {
    switch (navigatorType) {
      case NavigatorType.push:
        if (Platform.isIOS) {
          await  navigationKey.currentState?.push<T>(CupertinoPageRoute(builder: (context) => navigateTo));
        } else {
          await navigationKey.currentState?.push<T>(
              PageRouteBuilder(
                  transitionDuration: duration,
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation,
                        curve: Curves.fastOutSlowIn,
                        reverseCurve: Curves.easeInOutBack);
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  navigateTo));
        }
        break;
      case NavigatorType.pushAndPopUntil:
        if (Platform.isIOS) {
          await navigationKey.currentState?.pushAndRemoveUntil<T>(CupertinoPageRoute(builder: (context) => navigateTo),
                  (route) => false);
        } else {
          await navigationKey.currentState?.pushAndRemoveUntil<T>(PageRouteBuilder(
                transitionDuration: duration,
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  animation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastOutSlowIn,
                      reverseCurve: Curves.easeInOutBack);
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                navigateTo,
              ),
                  (route) => false);
        }
        break;
      case NavigatorType.animation:
        await navigationKey.currentState!.push<T>(
            PageRouteBuilder(
                transitionDuration: duration,
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  if (animationType == AnimationType.fade) {
                    animation = CurvedAnimation(
                        parent: animation,
                        curve: Curves.fastOutSlowIn,
                        reverseCurve: Curves.easeInOutBack);
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  } else {
                    animation = CurvedAnimation(
                        parent: animation,
                        curve: Curves.elasticInOut,
                        reverseCurve: Curves.elasticIn);
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child,
                    );
                  }
                },
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                navigateTo));
    }
  }
}

