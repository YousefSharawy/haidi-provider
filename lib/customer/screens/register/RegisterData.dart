part of 'RegisterImports.dart';

class RegisterData {
  final GenericBloc<File?> profileImageCubit = GenericBloc(null);
  final GenericBloc<File?> tradeImageCubit = GenericBloc(null);
  final GenericBloc<File?> taxImageCubit = GenericBloc(null);
  final GenericBloc<File?> logoImageCubit = GenericBloc(null);
  final GenericBloc<bool> termsAgreement = GenericBloc(false);
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final GenericBloc<bool> confirmPasswordBloc = GenericBloc(true);
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController taxNum = TextEditingController();
  final TextEditingController placeName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController trade = TextEditingController();
  final TextEditingController tax = TextEditingController();
  final TextEditingController logo = TextEditingController();
  final TextEditingController description = TextEditingController();
  final GlobalKey<DropdownSearchState> cityKey = GlobalKey();
  final LocationCubit locationCubit = LocationCubit();
  final TextEditingController address = TextEditingController();
  GenericBloc<bool> checkCubit = GenericBloc(false);
  CitiesModels? citiesModel;

  void selectCity(CitiesModels? model) {
    citiesModel = model != null ? model : null;
  }

  setProfileImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      profileImageCubit.onUpdateData(image);
    }
  }

  setTradeImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      tradeImageCubit.onUpdateData(image);
    }
  }

  setTaxImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      taxImageCubit.onUpdateData(image);
    }
  }

  setLogoImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      logoImageCubit.onUpdateData(image);
    }
  }

  onLocationClick(BuildContext context) async {
    var _loc = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 24.774265,
      lng: _loc?.longitude ?? 46.738586,
      address: "",
    ));
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_, animation, __) {
      return FadeTransition(
        opacity: animation,
        child: BlocProvider.value(
          value: locationCubit,
          child: LocationAddress(),
        ),
      );
    }));
  }

  _registerValidation(BuildContext context){
    if (profileImageCubit.state.data == null) {
      LoadingDialog.showSnackBar(context, tr(context, "plsEnterProfilePic"));
      return ;
    }
    if (tradeImageCubit.state.data == null) {
      LoadingDialog.showSnackBar(context, tr(context, "plsEnterCommercialNum"));
      return ;
    }
    if (taxImageCubit.state.data == null) {
      LoadingDialog.showSnackBar(context, tr(context, "plsEnterTaxNum"));
      return ;

    }
    if (logoImageCubit.state.data == null) {
      LoadingDialog.showSnackBar(context, tr(context, "plsEnterLogoPic"));
      return ;

    }
    if (citiesModel?.id == null) {
      LoadingDialog.showSnackBar(context, tr(context, "plsEnterCity"));
      return ;
    }
    if (termsAgreement.state.data == false) {
      LoadingDialog.showSnackBar(context, tr(context, "plsAgreeTerms"));
      return ;
    }
  }

  Future<void> userRegister(BuildContext context) async {
    String phoneEn = Utils.convertDigitsToLatin(phone.text);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FocusScope.of(context).requestFocus(FocusNode());
    _registerValidation(context);
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      RegisterEntities model = RegisterEntities(
        email: email.text,
        phone: phoneEn,
        lat: locationCubit.state.model?.lat.toString() ?? '',
        lng: locationCubit.state.model?.lng.toString() ?? '',
        location: address.text,
        cityId: citiesModel?.id ?? 0,
        placeName: placeName.text,
        deviceId: await messaging.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => ""),
        description: description.text,
        deviceType: Platform.isIOS ? "ios" : "android",
        lang: DioUtils.lang,
        logoPic: logoImageCubit.state.data,
        userName: userName.text,
        projectName: 'Heidi Provider',
        password: password.text,
        taxRecordText: taxNum.text,
        commercialRecord: tradeImageCubit.state.data,
        profileImage: profileImageCubit.state.data,
        taxRecord: taxImageCubit.state.data,
      );
      var result = await GeneralRepository(context).register(model);
      if (result) {
        btnKey.currentState!.animateReverse();
      } else {
        btnKey.currentState!.animateReverse();
      }
    }
  }




}
