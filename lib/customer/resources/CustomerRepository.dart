part of 'CustomerRepositoryImports.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerHttpMethods _customerHttpMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = new CustomerHttpMethods(_context);
  }

  Future<UserModel?> updateUserProfile(ProfileModel model) =>
      _customerHttpMethods.updateUserProfile(model);

  Future<List<OrderModel>> getOrderServiceProvider({required int status}) =>
      _customerHttpMethods.getOrderServiceProvider(status);

  Future<List<OrderModel>> getOrderMarketProvider({required int status}) =>
      _customerHttpMethods.getOrderMarketProvider(status);

  Future<List<EditCatModel>> updateProviderCategories(
          Map<String, dynamic> body) =>
      _customerHttpMethods.updateProviderCategories(body);

  Future<List<Workdate>> updateProviderWorkDates(
          {required Map<String, dynamic> body}) =>
      _customerHttpMethods.updateProviderWorkDates(body);
  Future<List<Workdate>> getProviderWorkDates() =>
      _customerHttpMethods.getProviderWorkDates();

  Future<HomeModel?> getHome(bool refresh) =>
      _customerHttpMethods.getHome(refresh);

  Future<List<MainCatModel>> getMainCatUser() =>
      _customerHttpMethods.getMainCatUser();

  Future<List<MainCatModel>> getSubCatUser(int mainCategoryId) =>
      _customerHttpMethods.getSubCatUser(mainCategoryId);

  Future<List<ServicesModel>> getService(int currentPage) =>
      _customerHttpMethods.getService(currentPage);

  Future<bool> deleteService(int serviceId) =>
      _customerHttpMethods.deleteService(serviceId);

  Future<bool> addService({required AddServiceModel addServiceModel}) =>
      _customerHttpMethods.addService(addServiceModel);

  Future<List<ServicesModel>> updateService(
          {required AddServiceModel addServiceModel}) =>
      _customerHttpMethods.updateService(addServiceModel);

  Future<List<ProductModel>> getStoreProduct() =>
      _customerHttpMethods.getStoreProduct();

  Future<bool> addProduct({required AddProductDots model}) =>
      _customerHttpMethods.addProduct(model);

  Future<List<DropDownModel>> getListMarketSubCategories() =>
      _customerHttpMethods.getListMarketSubCategories();

  Future<bool> deleteProduct({required int productId}) =>
      _customerHttpMethods.deleteProduct(productId);

  Future<List<ProductModel>> editProduct({required AddProductDots model}) =>
      _customerHttpMethods.editProduct(model);

  Future<List<OfferModel>> getListOffer() =>
      _customerHttpMethods.getListOffer();

  Future<List<OfferModel>> deleteOffer(int offerId) =>
      _customerHttpMethods.deleteOffer(offerId);

  Future<List<OfferModel>?> addNewOffer({required File? offerImage}) =>
      _customerHttpMethods.addNewOffer(offerImage);

  Future<marketOrderDetailsModel?> getMarketOrderDetails(
          {required int orderId}) =>
      _customerHttpMethods.getMarketOrderDetails(orderId);

  Future<List<ServiceOrderDetailsModel>> getServiceOrderDetails(
          {required int orderId}) =>
      _customerHttpMethods.getServiceOrderDetails(orderId);

  Future<String?> acceptProductOrder({required int orderId}) =>
      _customerHttpMethods.acceptProductOrder(orderId);

  Future<bool> acceptServiceProductOrder({required int orderId}) =>
      _customerHttpMethods.acceptServiceProductOrder(orderId);

  Future<bool?> refuseProductOrder(
          {required int orderId, required bool isMarket}) =>
      _customerHttpMethods.refuseProductOrder(orderId, isMarket);

  Future<bool?> finishProductOrder(
          {required int orderId, required bool isMarket}) =>
      _customerHttpMethods.finishProductOrder(orderId, isMarket);

  Future<List<NotificationModel>> getNotifications() =>
      _customerHttpMethods.getNotifications();

  Future<bool> removeSingleNotification({required int notificationId}) =>
      _customerHttpMethods.removeSingleNotification(notificationId);

  Future<int?> getWallet() => _customerHttpMethods.getWallet();

  Future<FinancialModel?> getFinancial() => _customerHttpMethods.getFinancial();

  Future<bool?> financialSettelment() =>
      _customerHttpMethods.financialSettelment();
}
