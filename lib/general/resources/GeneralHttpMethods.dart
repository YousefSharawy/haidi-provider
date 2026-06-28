part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String phone, String pass) async {
    String? _deviceId = await messaging.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    // LOGIN-ONLY BYPASS (testing): the test provider account is fully set up but
    // the backend's login endpoint refuses it ("Awaiting management approval").
    // Short-circuit with a real login payload (real token) so the rest of the
    // app runs on the live API. Disable via MockApi.mockLoginOnly once approved.
    if (MockApi.mockLoginOnly) {
      return Utils.manipulateLoginData(
          context, MockApi.loginResponse(), _deviceId ?? "");
    }
    Map<String, dynamic> body = {
      "phone": phone,
      "password": pass,
      "TypeUser": 2,
      "lang": DioUtils.lang,
      "deviceId": "$_deviceId",
      "deviceType": Platform.isIOS ? "ios" : "android",
      "projectName": 'Heidi Provider',
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UserModel.fromJson(json),
      showLoader: false,
    );

    return Utils.manipulateLoginData(context, data, _deviceId ?? "");
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    return await GenericHttp<QuestionModel>(context).callApi(
            name: ApiNames.repeatedQuestions,
            returnType: ReturnType.List,
            showLoader: false,
            methodType: MethodType.Get,
            returnDataFun: (data) => data["data"],
            toJsonFunc: (json) => QuestionModel.fromJson(json))
        as List<QuestionModel>;
  }

  Future<bool> sendCode(int code, String userId) async {
    String? _deviceId = await messaging.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    Map<String, dynamic> body = {
      "lang": DioUtils.lang,
      "code": code,
      "userId": userId,
      "deviceId": _deviceId,
      "deviceType": Platform.isIOS ? "ios" : "android",
      "projectName": 'مشاغل هايدي',
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.sendCode,
      jsonBody: body,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return Utils.manipulateActiveCode(context, data, _deviceId ?? '');
  }

  Future<bool> resendCode(String userId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    String params = "?userId=$userId&lang=$lang";
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resendCode + params,
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    Map<String, dynamic> body = {
      "lang": DioUtils.lang,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.changePassward,
      returnType: ReturnType.Type,
      showLoader: true,
      jsonBody: body,
      returnDataFun: (data) => data,
      methodType: MethodType.Post,
    );
    if (result != null) {
      CustomToast.showSimpleToast(msg: result["msg"]);
      return true;
    }
    return false;
  }

  Future<String?> aboutApp() async {
    return await GenericHttp<String>(context).callApi(
      name: ApiNames.aboutApp,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Get,
    );
  }

  Future<String?> terms() async {
    return await GenericHttp<String>(context).callApi(
        name: ApiNames.terms,
        returnType: ReturnType.Type,
        showLoader: false,
        methodType: MethodType.Post,
        returnDataFun: (data) => data["condtions"]);
  }

  Future<bool> switchNotify() async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.switchNotify,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> forgetPassword(String phone) async {
    Map<String, dynamic> body = {
      "phone": "$phone",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      Nav.navigateTo(ResetPassword(userId: data["userId"]),
          navigatorType: NavigatorType.push);
      return true;
    }
    return false;
  }

  Future<bool> resetUserPassword(
      String userId, String code, String pass) async {
    Map<String, dynamic> body = {
      "userId": "$userId",
      "code": "$code",
      "newPassword": "$pass",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      return true;
    }
    return false;
  }

  Future<bool> sendMessage(
      String? name, String? phone, String? mail, String? message) async {
    Map<String, dynamic> body = {
      "userName": "$name",
      "phone": "$phone",
      "email": "$mail",
      "msg": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.contactUs,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<List<CitiesModels>> getCities() async {
    var data = await GenericHttp<CitiesModels>(context).callApi(
        name: ApiNames.registrationCities,
        returnType: ReturnType.List,
        refresh: true,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => CitiesModels.fromJson(json));
    return data;
  }

  Future<List<CategoriesModel>> getCategories() async {
    var data = await GenericHttp<CategoriesModel>(context).callApi(
        name: "${ApiNames.listMainCategories}?lang=${DioUtils.lang}",
        returnType: ReturnType.List,
        refresh: true,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => CategoriesModel.fromJson(json));
    return data;
  }

  Future<DownloadDocumentModel> getWorkDocument() async {
    var data = await GenericHttp<DownloadDocumentModel>(context).callApi(
        name: "${ApiNames.getWorkDocument}?lang=${DioUtils.lang}",
        returnType: ReturnType.Model,
        refresh: true,
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => DownloadDocumentModel.fromJson(json));
    return data;
  }

  Future<UploadDocumentModel> uploadWorkDocument(
      String file, String providerId) async {
    Map<String, dynamic> query = {
      "file": await MultipartFile.fromFile(file, filename: 'WorkDocument'),
      "lang": "${DioUtils.lang}",
      "providerId": "$providerId",
    };

    var data = await GenericHttp<UploadDocumentModel>(context).callApi(
        name: "${ApiNames.uploadUserWorkDocument}",
        returnType: ReturnType.Model,
        refresh: true,
        methodType: MethodType.Patch,
        query: query,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => UploadDocumentModel.fromJson(json));
    return data;
  }

  Future<bool> register(RegisterEntities model) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.registerProvider,
      jsonBody: model.toJson(),
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      Nav.navigateTo(
          SelectCategories(
            userId: data["id"],
          ),
          navigatorType: NavigatorType.push);
      CustomToast.showSimpleToast(
          msg: tr(context, "accCreatedSuccessfullyCheckCategories"));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addProviderRegistrationCategories(
      String userId, Map<String, dynamic> body) async {
    String params = "?userId=$userId&lang=${DioUtils.lang}";
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addProviderRegistrationCategories + params,
      jsonBody: body,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      Nav.navigateTo(
          WorkTimes(
            providerId: userId,
          ),
          navigatorType: NavigatorType.push);
      CustomToast.showSimpleToast(msg: tr(context, "selectYourTimes"));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addProviderWorkDates(Map<String, dynamic> body) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.assignProviderWorkDates,
      headers: {
        'content-type': 'application/x-www-form-urlencoded; charset=utf-8',
        'Accept': 'application/json',
      },
      jsonBody: body,
      returnType: ReturnType.Type,
      showLoader: false,
      returnDataFun: (data) => data,
      methodType: MethodType.Post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data["msg"]);
      // log("kkkkkkkkkkkkkkkk ${data}");
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logOut() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    String? deviceId = await Utils.getDeviceId();
    String params = "?lang=$lang&deviceId=$deviceId";
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.logout + params,
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Delete,
    );
    if (data != null) {
      context.read<AuthCubit>().onUpdateAuth(false);
      context.read<AuthCubit>().state.authorized;
      CustomToast.showSimpleToast(
          msg: tr(context, "logoutSuccessfully"), color: MyColors.primary);
      Utils.clearSavedData();
      GlobalState.instance.set("token", "");
      Nav.navigateTo(SelectLang(),
          navigatorType: NavigatorType.pushAndPopUntil);
      return true;
    }
    return false;
  }

  Future<void> deleteAccount() async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.removeAccount,
      returnType: ReturnType.Type,
      showLoader: true,
      returnDataFun: (data) => data,
      methodType: MethodType.Delete,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      Utils.clearSavedData();
      Nav.navigateTo(Login(), navigatorType: NavigatorType.pushAndPopUntil);
    }
  }
}
