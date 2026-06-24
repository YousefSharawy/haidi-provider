part of 'ChangePasswordImports.dart';

class ChangePasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TextEditingController oldPassword = new TextEditingController();
  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();
  GenericBloc<bool> showCurrentPassBloc = GenericBloc(true);
  GenericBloc<bool> showNewPassBloc = GenericBloc(true);
  GenericBloc<bool> showConfirmNewPassBloc = GenericBloc(true);

  void setChangePassword(BuildContext context)async{
    FocusScope.of(context).requestFocus(FocusNode());
    if(formKey.currentState!.validate()){
      var result = await GeneralRepository(context).changePassword(newPassword: newPassword.text,oldPassword: oldPassword.text);
      if(result){
        oldPassword.clear();
        newPassword.clear();
        confirmNewPassword.clear();
        navigationKey.currentState!.pop();
      }

    }
  }

}
