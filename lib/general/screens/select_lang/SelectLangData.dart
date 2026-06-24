part of 'SelectLangImports.dart';

class SelectLangData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  void setUserLang(BuildContext context, String lang) async {
    Utils.changeLanguage(lang, context);
    Nav.navigateTo(Login(), navigatorType: NavigatorType.push);
    // Nav.navigateTo(GetWorkDocument(userId: '1',), navigatorType: NavigatorType.push);
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
