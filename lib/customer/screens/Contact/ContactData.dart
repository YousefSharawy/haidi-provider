part of 'ContactImports.dart';

class ContactData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController phone = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController msg = TextEditingController();
  final TextEditingController mail = TextEditingController();

  contactUs(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await GeneralRepository(context).sendMessage(
        name: name.text,
        phone: phone.text,
        message: msg.text,
        mail: mail.text,
      );
      if (result) {
        LoadingDialog.showSnackBar(context, tr(context, "urMsgSendSuccess"));
        phone.clear();
        name.clear();
        msg.clear();
        btnKey.currentState!.animateReverse();
        navigationKey.currentState!.pop();
      }
      btnKey.currentState!.animateReverse();
    }
  }
}
