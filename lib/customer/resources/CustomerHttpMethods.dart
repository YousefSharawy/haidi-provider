part of 'CustomerRepositoryImports.dart';

class CustomerHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CustomerHttpMethods(this.context);

  Future<UserModel?> updateUserProfile(ProfileModel model) async {
    UserModel? result = await GenericHttp<UserModel>(context).callApi(
      name: ApiNames.updateDataUser,
      jsonBody: model.toJson(),
      returnType: ReturnType.Model,
      methodType: MethodType.Post,
      toJsonFunc: (data) => UserModel.fromJson(data),
      returnDataFun: (data) => data,
      showLoader: false,
    );
    if(result != null){
      return result ;
    }else{
      return null ;
    }
  }

  Future<List<OrderModel>> getOrderServiceProvider(int status) async {
    var result = await GenericHttp<OrderModel>(context).callApi(
      name: ApiNames.listServiceOrdersProvider,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      query: {'lang' : DioUtils.lang,'status' : status},
      toJsonFunc: (data) => OrderModel.fromJson(data),
      returnDataFun: (data) => data,
      showLoader: false,
    );
    log('ccccccccccccc$result');
    return result;
  }

  Future<List<OrderModel>> getOrderMarketProvider(int status) async {
    var result = await GenericHttp<OrderModel>(context).callApi(
      name: ApiNames.listProductOrdersProvider + "?lang=${DioUtils.lang}&status=$status",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      toJsonFunc: (data) => OrderModel.fromJson(data),
      returnDataFun: (data) => data,
      showLoader: false,
    ) as List<OrderModel>;
    print('ccccccccccccc$result');
    return result;
  }

  Future<List<EditCatModel>> updateProviderCategories(
      Map<String, dynamic> body) async {
    String params = "?lang=${DioUtils.lang}";
    List<EditCatModel> result = await GenericHttp<EditCatModel>(context).callApi(
            name: ApiNames.updateMainCategories + params,
            jsonBody: body,
            returnType: ReturnType.List,
            showLoader: false,
            methodType: MethodType.Post,
            toJsonFunc: (data) => EditCatModel.fromJson(data),
            returnDataFun: (data) => data);
    return result;
  }

  Future<List<Workdate>> getProviderWorkDates() async {
    List<Workdate> result = await GenericHttp<Workdate>(context).callApi(
      name: ApiNames.getWorkTimes,
      returnType: ReturnType.List,
      showLoader: false,
      returnDataFun: (data) => data,
      methodType: MethodType.Post,
      toJsonFunc: (data) => Workdate.fromJson(data),
    );
    return result;
  }

  Future<List<Workdate>> updateProviderWorkDates(
      Map<String, dynamic> body) async {
    List<Workdate> result = await GenericHttp<Workdate>(context).callApi(
      name: ApiNames.editWorkTimes,
      jsonBody: body,
      returnType: ReturnType.List,
      showLoader: false,
      returnDataFun: (data) => data,
      methodType: MethodType.Post,
      toJsonFunc: (data) => Workdate.fromJson(data),
    );
    return result;
  }

  Future<HomeModel?> getHome(bool refresh) async {
    String params = "?lang=${DioUtils.lang}";
    HomeModel? result = await GenericHttp<HomeModel>(context).callApi(
      name: ApiNames.getHome + params,
      returnType: ReturnType.Model,
      showLoader: false,
      refresh: refresh,
      returnDataFun: (data) => data,
      methodType: MethodType.Get,
      toJsonFunc: (data) => HomeModel.fromJson(data),
    );
    return result;
  }

  Future<List<MainCatModel>> getMainCatUser() async {
    UserModel user = context.read<UserCubit>().state.model;
    String params = "?userId=${user.id}&lang=${DioUtils.lang}";
    var data = await GenericHttp<MainCatModel>(context).callApi(
        name: ApiNames.listUserMainCategories + params,
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => MainCatModel.fromJson(json));
    return data;
  }

  Future<List<DropDownModel>> getListMarketSubCategories() async {
    String params = "?lang=${DioUtils.lang}";
    var data = await GenericHttp<DropDownModel>(context).callApi(
        name: ApiNames.listMarketSubCategories + params,
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => DropDownModel.fromJson(json));
    return data;
  }

  Future<List<MainCatModel>> getSubCatUser(int mainCategoryId) async {
    String params = "?lang=${DioUtils.lang}&mainCategoryId=$mainCategoryId";
    var data = await GenericHttp<MainCatModel>(context).callApi(
        name: ApiNames.listSubCategories + params,
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => MainCatModel.fromJson(json));
    return data;
  }

  Future<List<ServicesModel>> getService(int currentPage) async {
    String params = "?lang=${DioUtils.lang}&currentPage=$currentPage";
    var data = await GenericHttp<ServicesModel>(context).callApi(
        name: ApiNames.listUserServices + params,
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => ServicesModel.fromJson(json));
    return data;
  }

  Future<bool> deleteService(int serviceId) async {
    String params = "?serviceId=$serviceId&lang=${DioUtils.lang}";
    await GenericHttp<bool>(context).callApi(
      name: ApiNames.deleteService + params,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
      // toJsonFunc: (json) => ServicesModel.fromJson(json)
    );
    return true;
  }

  Future<bool> addService(AddServiceModel addServiceModel) async {
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addNewService,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      jsonBody: addServiceModel.toJson(),
      showLoader: false,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      return true;
    }
    return false;
  }

  Future<List<ServicesModel>> updateService(
      AddServiceModel addServiceModel) async {
    List<ServicesModel>? result =
        await GenericHttp<ServicesModel>(context).callApi(
      name: ApiNames.updateService,
      returnType: ReturnType.List,
      methodType: MethodType.Post,
      jsonBody: addServiceModel.toJson(),
      showLoader: false,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => ServicesModel.fromJson(json),
    );
    if (result != null) {
      return result;
    }
    return [];
  }

  Future<List<ProductModel>> getStoreProduct() async {
    List<ProductModel>? result =
        await GenericHttp<ProductModel>(context).callApi(
      name: ApiNames.listUserProducts + "?lang=${DioUtils.lang}",
      returnType: ReturnType.List,
      methodType: MethodType.Post,
      showLoader: false,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => ProductModel.fromJson(json),
    );
    if (result != null) {
      return result;
    }
    return [];
  }

  Future<bool> addProduct(AddProductDots model) async {
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addNewProduct,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: false,
      jsonBody: model.toJson(),
      returnDataFun: (data) => data,
    );
    if (result != null) {
      LoadingDialog.showSnackBar(
          context, result['msg']);
      return true;
    }
    return false;
  }

  Future<List<ProductModel>> editProduct(AddProductDots model) async {
    List<ProductModel>? result =
        await GenericHttp<ProductModel>(context).callApi(
      name: ApiNames.updateProduct,
      returnType: ReturnType.List,
      methodType: MethodType.Post,
      showLoader: false,
      jsonBody: model.toJson(),
      returnDataFun: (data){
        if(data != null) {
          LoadingDialog.showSnackBar(
              context, data['msg']);
          return data['data'];
        }
      },
      toJsonFunc: (json) => ProductModel.fromJson(json),
    );
    if (result != null) {
      return result;
    }
    return [];
  }

  Future<bool> deleteProduct(int productId) async {
    String params = "?productId=$productId&lang=${DioUtils.lang}";
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.deleteProduct + params,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      return true;
    }
    return false;
  }

  Future<List<OfferModel>> getListOffer() async {
    var data = await GenericHttp<OfferModel>(context).callApi(
        name: ApiNames.listUserOffers,
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => OfferModel.fromJson(json));
    return data;
  }

  Future<List<OfferModel>> deleteOffer(int offerId) async {
    String params = "?offerId=$offerId";
    var data = await GenericHttp<OfferModel>(context).callApi(
        name: ApiNames.deleteOffer + params,
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        showLoader: true,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => OfferModel.fromJson(json));
    return data;
  }

  Future<List<OfferModel>?> addNewOffer(File? offerImage) async {
    Map<String, dynamic> body = {
      "lang": DioUtils.lang,
      "offerImage": offerImage,
    };
    List<OfferModel>? result = await GenericHttp<OfferModel>(context).callApi(
        name: ApiNames.addNewOffer,
        returnType: ReturnType.List,
        methodType: MethodType.Post,
        showLoader: false,
        jsonBody: body,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => OfferModel.fromJson(json));
    if (result != null) {
      return result;
    }
    return null;
  }

  Future<marketOrderDetailsModel?> getMarketOrderDetails(int orderId) async {
    print('======================');
    print(orderId);
    print(DioUtils.lang);
    print('======================');
    String params = "?orderId=$orderId&lang=${DioUtils.lang}";
    marketOrderDetailsModel? result = await GenericHttp<marketOrderDetailsModel>(context)
        .callApi(
            name: ApiNames.GetProductOrderDetailsForProvider + params,
            returnType: ReturnType.Model,
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => marketOrderDetailsModel.fromJson(json));
    if (result != null) {
      return result;
    }
    return null;
  }
  Future<List<ServiceOrderDetailsModel>> getServiceOrderDetails(int orderId) async {
    String params = "?orderId=$orderId&lang=${DioUtils.lang}";
    List<ServiceOrderDetailsModel>? result = await GenericHttp<ServiceOrderDetailsModel>(context)
        .callApi(
            name: ApiNames.getServiceOrderDetailsForProvider + params,
            returnType: ReturnType.List,
            methodType: MethodType.Get,
            showLoader: false,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => ServiceOrderDetailsModel.fromJson(json));
    if (result != null) {
      return result;
    }
    return [];
  }

  Future<String?> acceptProductOrder(int orderId) async {
    String params = "?orderId=$orderId&lang=${DioUtils.lang}";
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.acceptProductOrder + params,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data["msg"],
    );
    if (result != null) {
      return result;
    }
    return null;
  }
  Future<bool> acceptServiceProductOrder(int orderId) async {
    String params = "?orderId=$orderId&lang=${DioUtils.lang}";
    // returnDataFun returns the whole response body (a Map), so the result must
    // be `dynamic`, not `bool?` — assigning a Map to bool? throws and silently
    // fails the accept. A non-null body signals success. (matches market accept)
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.acceptServiceOrder + params,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      return true;
    }
    return false;
  }

  Future<bool> refuseProductOrder(int orderId,bool isMarket) async {
    String params = "?orderId=$orderId&lang=${DioUtils.lang}";
    // returnDataFun returns the whole body (a Map); result must be dynamic, not
    // bool? (a Map→bool? cast throws and silently fails the reject).
    dynamic result = await GenericHttp<bool>(context).callApi(
      name:isMarket ?  ApiNames.refuseMarketProductOrder + params:ApiNames.refuseServiceOrder + params,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      return true ;
    }
    return false;
  }

  Future<bool> finishProductOrder(int orderId,bool isMarket) async {
    String params = "?orderId=$orderId&lang=${DioUtils.lang}";
    // returnDataFun returns the whole body (a Map); result must be dynamic, not
    // bool? (a Map→bool? cast throws and silently fails finishing the order).
    dynamic result = await GenericHttp<bool>(context).callApi(
      name:isMarket? ApiNames.finishMarketProductOrder + params :ApiNames.finishServiceOrder + params,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      return true ;
    }
    return false;
  }

  Future<List<NotificationModel>> getNotifications() async {
    String params = "?lang=${DioUtils.lang}";
    List<NotificationModel>? result = await GenericHttp<NotificationModel>(context)
        .callApi(
        name: ApiNames.providerNotifications + params,
        returnType: ReturnType.List,
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data,
        toJsonFunc: (json) => NotificationModel.fromJson(json));
    if (result != null) {
      return result;
    }
    return [];
  }
  Future<bool> removeSingleNotification(int notificationId) async {
    String params = "?notificationId=$notificationId&lang=${DioUtils.lang}";
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.removeSingleNotification + params ,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      return true ;
    }
    return false;
  }
  Future<int?> getWallet() async {
    int? result = await GenericHttp<int>(context).callApi(
      name: ApiNames.getWallet  ,
      returnType: ReturnType.Type,
      methodType: MethodType.Get,
      showLoader: true,
      returnDataFun: (data) => data["wallet"],
    );
    if (result != null) {
     return result ;
    }
    return null;
  }
  Future<FinancialModel?> getFinancial() async {
    String params = "?lang=${DioUtils.lang}";
    FinancialModel? result = await GenericHttp<FinancialModel>(context).callApi(
      name: ApiNames.getProviderFinancialData + params ,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      showLoader: true,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => FinancialModel.fromJson(json),
    );
    if (result != null) {
     return result ;
    }
    return null;
  }
  Future<bool?> financialSettelment() async {
    String params = "?lang=${DioUtils.lang}";
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.financialSettelment + params ,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    if (result != null) {
      LoadingDialog.showSnackBar(context, result["msg"]);
      return true ;
    }
    return false;

  }
}
