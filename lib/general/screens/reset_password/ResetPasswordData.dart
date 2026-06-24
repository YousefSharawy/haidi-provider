part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc =GenericBloc(true);
  final GenericBloc<bool> confirmPasswordBloc =GenericBloc(true);


  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();
  final TextEditingController code = new TextEditingController();


  void onResetPassword(BuildContext context, String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      bool result = await GeneralRepository(context).resetUserPassword(userId, code.text, newPassword.text);
      btnKey.currentState!.animateReverse();
      if (result) {
        LoadingDialog.showSnackBar(context, tr(context, "passChangedSuccessfully"));
        Nav.navigateTo( Login(), navigatorType: NavigatorType.pushAndPopUntil);
      }
    }
  }
}
