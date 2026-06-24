part of 'ForgetPasswordImports.dart';

class ForgerPasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController phone = new TextEditingController();

  void onForgetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
    bool result =   await GeneralRepository(context).forgetPassword(phone.text);
    if(result){
      LoadingDialog.showSnackBar(context, tr(context,"sendActiveCodeTrowNumber"));
      btnKey.currentState!.animateReverse();
    }
      btnKey.currentState!.animateReverse();
    }
  }
}
