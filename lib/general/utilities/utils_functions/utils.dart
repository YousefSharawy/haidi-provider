part of 'UtilsImports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool? initTheme = prefs.getBool("dark")??false;
    // Utils.changeAppTheme(context,initTheme: initTheme) ;
    initDio(lang: "ar");
    initCustomWidgets(language: "ar");
    GlobalState.instance.set("token", "");
    try {
      // FCM may be unavailable (offline / no Play Services); time out so the
      // splash always proceeds to navigation instead of hanging.
      final message = await FirebaseMessaging.instance
          .getInitialMessage()
          .timeout(const Duration(seconds: 3), onTimeout: () => null);
      if (message != null && message.data != {}) {
        handleNotificationsTap(message.data.toString());
      }
    } catch (_) {}
    var strUser = prefs.get("user");
    if (strUser != null) {
      UserModel data = UserModel.fromJson(json.decode("$strUser"));
      GlobalState.instance.set("token", data.token);
      changeLanguage(data.lang ?? "ar", context);
      setCurrentUserData(data, context);
    } else {
      Nav.navigateTo( SelectLang(),
          navigatorType: NavigatorType.push,
          duration: Duration(milliseconds: 1000));
    }
  }

  static initDio({required String lang}) {
    DioUtils.init(
      baseUrl: ApiNames.baseUrl,
      style: CustomInputTextStyle(lang: lang),
      primary: MyColors.primary,
      language: lang,
      dismissFunc: EasyLoading.dismiss,
      showLoadingFunc: LoadingDialog.showLoadingDialog,
      branch: ApiNames.branch,
      authClick: () {},
      authLink: '',
    );
  }

  static initCustomWidgets({required String language}) {
    WidgetUtils.init(
        style: CustomInputTextStyle(lang: language),
        primary: MyColors.primary,
        language: language,
        inputStyle: (
                {Color? enableColor,
                Color? fillColor,
                Color? focusBorderColor,
                String? hint,
                Color? hintColor,
                String? label,
                EdgeInsets? padding,
                Widget? prefixIcon,
                Widget? prefixWidget,
                BorderRadius? radius,
                Widget? suffixIcon,
                Widget? suffixWidget}) =>
            CustomInputDecoration(
                focusColor: focusBorderColor,
                hintColor: hintColor,
                lang: language,
                labelTxt: label,
                borderRaduis: radius,
                hint: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enableColor: enableColor,
                customFillColor: fillColor,
                padding: padding));
  }

  static Future<bool> manipulateLoginData(
      BuildContext context, dynamic data, String token) async {
    if (data != null) {
      await Utils.setDeviceId("$token");
      UserModel user = UserModel.fromJson(data);
      user.lang = context.read<LangCubit>().state.locale.languageCode;
      GlobalState.instance.set("token", user.token);
      await Utils.saveUserData(user);
      Utils.setCurrentUserData(user, context);
      return true;
    }
    return false;
  }

  static void setCurrentUserData(UserModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    if (model.mainCategories!.isEmpty) {
      context.read<AuthCubit>().onUpdateAuth(false);
      LoadingDialog.showSnackBar(context, 'من فضلك اختر الاقسام الرئيسية');
      Nav.navigateTo( SelectCategories(userId: model.id),
          navigatorType: NavigatorType.push);
    } else if (model.workdates!.isEmpty) {
      LoadingDialog.showSnackBar(context, 'من فضلك اختر مواعيد العمل');
      context.read<AuthCubit>().onUpdateAuth(false);
      Nav.navigateTo( WorkTimes(providerId: model.id),
          navigatorType: NavigatorType.push);
    } else if (model.activedByCode == false) {
      LoadingDialog.showSnackBar(context, 'من فضلك اختر مواعيد العمل');
      context.read<AuthCubit>().onUpdateAuth(false);
      Nav.navigateTo( ActiveAccount(userId: model.id),
          navigatorType: NavigatorType.push);
    } else {
      context.read<AuthCubit>().onUpdateAuth(true);
      Nav.navigateTo( Home(),
          navigatorType: NavigatorType.pushAndPopUntil);
    }
  }

  static Future<bool> manipulateActiveCode(
      BuildContext context, dynamic data, String deviceId) async {
    if (data != null) {
      bool active = data["activedByCode"];
      if (active) {
        await Utils.setDeviceId("$deviceId");
        UserModel user = UserModel.fromJson(data);
        GlobalState.instance.set("token", user.token);
        GlobalState.instance.set("token", user.token);
        context.read<UserCubit>().onUpdateUserData(user);
        await Utils.saveUserData(user);
        Nav.navigateTo( Home(),
            navigatorType: NavigatorType.pushAndPopUntil);
      } else {
        LoadingDialog.showSnackBar(
            context, 'حدث خطأ ما اثناء تفعيل الحساب قم بالتسجيل من جديد');
        Nav.navigateTo( Login(),
            navigatorType: NavigatorType.pushAndPopUntil);
      }
      return true;
    }
    return false;
  }

  static changeAppTheme(BuildContext context, {bool? initTheme}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dark = context.read<ThemeCubit>().state.isDark;
    if (initTheme != null) {
      context.read<ThemeCubit>().onUpdateTheme(initTheme);
    } else {
      context.read<ThemeCubit>().onUpdateTheme(!dark);
      dark = context.read<ThemeCubit>().state.isDark;
      prefs.setBool("dark", dark);
    }
  }

  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }

  static void changeLanguage(String lang, BuildContext context) {
    DioUtils.lang = lang;
    WidgetUtils.lang = lang;
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static UserModel getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static String getCurrentUserId({required BuildContext context}) {
    var provider = context.watch<UserCubit>().state.model;
    return provider.id;
  }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      CustomToast.showToastNotification("من فضلك تآكد من الرابط");
    }
  }

  static void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    print(_whatsAppUrl);
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      throw 'حدث خطأ ما';
    }
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunch('$url')) {
        await launch('$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    LoadingDialog.showLoadingDialog();
    SharePlus.instance.share(ShareParams(text: url)).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  static Future<File?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  static void copToClipboard(
      {required String text, required GlobalKey<ScaffoldState> scaffold}) {
    if (text.trim().isEmpty) {
      CustomToast.showToastNotification("لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        CustomToast.showToastNotification("تم النسخ بنجاح");
      });
    }
  }

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomToast.showSimpleToast(msg: 'Location services are disabled');
      return null;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomToast.showSimpleToast(msg: 'Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      CustomToast.showSimpleToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  static void navigateToMapWithDirection(
      {required String lat,
      required String lng,
      required BuildContext context}) async {
    if (lat == "0") return;
    try {
      final coords = Coords(double.parse(lat), double.parse(lng));
      final title = "Destination";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      CustomToast.showSimpleToast(msg: "$e");
    }
  }

  static Future<String> getAddress(LatLng latLng, BuildContext context) async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      // List<geocoding.Placemark> placeMarks = await geocoding
      //     .placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      var data =
          "${placeMarks[0].country ?? ""}  ${placeMarks[0].administrativeArea ?? ""}  ${placeMarks[0].subAdministrativeArea ?? ""} ${placeMarks[0].street ?? ""}";
      print(data);
      return data;
    } catch (e) {
      return "";
    }
  }
  // static Future<String> getAddress(LatLng latLng, BuildContext context) async {
  //   GeoCode geoCode = GeoCode();
  //
  //   try {
  //     var address = await geoCode.reverseGeocoding(latitude: latLng.latitude, longitude: latLng.longitude);
  //     var data = "${address.countryName??""}  ${address.city??""}  ${address.region??""}  ${address.streetAddress??""}";
  //     print(data);
  //     return data;
  //   } catch (e) {
  //     return "";
  //   }
  // }

  // static Future<String> getAddress(LatLng latLng, BuildContext context) async {
  //   final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
  //   List<Address> addresses =
  //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   var first = addresses.first;
  //   print("${first.featureName} : ${first.addressLine}");
  //   return first.addressLine;
  // }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }

  static void navigateToLocationAddress(
      BuildContext context, LocationCubit locCubit) async {
    FocusScope.of(context).requestFocus(FocusNode());
    LoadingDialog.showLoadingDialog();
    var current = await Utils.getCurrentLocation();
    LocationModel locationModel = locCubit.state.model!;
    if (current != null) {
      locationModel = LocationModel(
          lat: current.latitude, lng: current.longitude, address: "");
    }
    double lat = locationModel.lat;
    double lng = locationModel.lng;
    String address = await getAddress(LatLng(lat, lng), context);
    locationModel.address = address;
    locCubit.onLocationUpdated(locationModel);
    EasyLoading.dismiss();
    navigationKey.currentState!.push(
      CupertinoPageRoute(
        builder: (cxt) => BlocProvider.value(
          value: locCubit,
          child: LocationAddress(),
        ),
      ),
    );
  }
}
