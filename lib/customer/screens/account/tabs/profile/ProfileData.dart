part of 'ProfileImports.dart';

class ProfileData {
  static final ProfileData instance = ProfileData._();

  ProfileData._();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController placeName = TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController trade = new TextEditingController();
  final TextEditingController tax = new TextEditingController();
  final TextEditingController logo = new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final GenericBloc<File?> profileImageCubit = new GenericBloc(null);
  final GenericBloc<File?> tradeImageCubit = new GenericBloc(null);
  final GenericBloc<File?> taxImageCubit = new GenericBloc(null);
  final GenericBloc<File?> logoImageCubit = new GenericBloc(null);
  final GlobalKey<DropdownSearchState> cityKey = new GlobalKey();
  final LocationCubit locationCubit = new LocationCubit();
  final GenericBloc<bool> isAvailableBloc =GenericBloc(true) ;
  CitiesModels? citiesModel;

  void selectCity(CitiesModels? model) {
    citiesModel = model != null ? model : null;
  }

  setImage() async {
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

  saveUserProfile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    var user = context.read<UserCubit>().state.model;
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      ProfileModel model = ProfileModel(
        email: email.text,
        profileImg: profileImageCubit.state.data,
        name: name.text,
        phone: phone.text,
        cityId: citiesModel?.id??0,
        lang: DioUtils.lang,
        description: description.text,
        placeName: placeName.text,
        isAvailable: isAvailableBloc.state.data,
        providerId: user.id,
        lat: locationCubit.state.model?.lat.toString()??'0.0',
        lng: locationCubit.state.model?.lng.toString()??'0.0',
        location: address.text,
        commercialRecordImg: tradeImageCubit.state.data,
        taxRecordImg: taxImageCubit.state.data,
        logoImg: profileImageCubit.state.data
      );
      var result = await CustomerRepository(context).updateUserProfile(model);
      if (result != null) {
        LoadingDialog.showSnackBar(context, 'تم التعديل بنجاح');
        user = result;
        user.token = GlobalState.instance.get("token");
        await Utils.saveUserData(user);
        context.read<UserCubit>().onUpdateUserData(user);
        btnKey.currentState!.animateReverse();
        navigationKey.currentState!.pop();
      }
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();

  }


  changeIsAvailable(BuildContext context,bool value){
    isAvailableBloc.onUpdateData(value);
  }

  void initProfile(BuildContext context) {
    UserModel user = context.read<UserCubit>().state.model;
    isAvailableBloc.onUpdateData(user.isAvilable!);
    name.text = user.userName ?? '';
    email.text = user.email ?? '';
    placeName.text = user.placeName??'';
    description.text = user.description??'';
    phone.text = user.phone ?? '';
    address.text = user.location??'';
    citiesModel = CitiesModels(name: user.cityName , id: user.cityId ?? 0);
  }

  dispose() {
    description.dispose();
    email.dispose();
    phone.dispose();
    name.dispose();
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
}
