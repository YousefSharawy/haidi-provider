part of 'GeneralRepoImports.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;

  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<bool> setUserLogin(String phone, String pass) =>
      _generalHttpMethods.userLogin(phone, pass);

  Future<bool> sendCode(int code, String userId) =>
      _generalHttpMethods.sendCode(code, userId);

  Future<bool> resendCode(String userId) =>
      _generalHttpMethods.resendCode(userId);

  Future<bool> changePassword(
          {required String oldPassword, required String newPassword}) =>
      _generalHttpMethods.changePassword(oldPassword, newPassword);

  Future<String?> aboutApp() => _generalHttpMethods.aboutApp();

  Future<String?> terms() => _generalHttpMethods.terms();

  Future<bool> switchNotify() => _generalHttpMethods.switchNotify();

  Future<bool> forgetPassword(String phone) =>
      _generalHttpMethods.forgetPassword(phone);

  Future<bool> resetUserPassword(String userId, String code, String pass) =>
      _generalHttpMethods.resetUserPassword(userId, code, pass);

  Future<List<QuestionModel>> frequentQuestions() =>
      _generalHttpMethods.frequentQuestions();

  Future<DownloadDocumentModel> getWorkDocument() =>
      _generalHttpMethods.getWorkDocument();

  Future<UploadDocumentModel> uploadWorkDocument(
          String file, String providerId) =>
      _generalHttpMethods.uploadWorkDocument(file, providerId);

  Future<bool> sendMessage(
          {String? name, String? phone, String? mail, String? message}) =>
      _generalHttpMethods.sendMessage(name, mail, message, phone);

  Future<List<CitiesModels>> getCities() => _generalHttpMethods.getCities();

  Future<List<CategoriesModel>> getCategories() =>
      _generalHttpMethods.getCategories();

  Future<bool> register(RegisterEntities model) =>
      _generalHttpMethods.register(model);

  Future<bool> addProviderRegistrationCategories(
          String userId, Map<String, dynamic> body) =>
      _generalHttpMethods.addProviderRegistrationCategories(userId, body);

  Future<bool> addProviderWorkDates({required Map<String, dynamic> body}) =>
      _generalHttpMethods.addProviderWorkDates(body);

  Future<bool> logOut() => _generalHttpMethods.logOut();

  Future<void> deleteAccount() => _generalHttpMethods.deleteAccount();
}
