part of 'ChangePasswordImports.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ChangePasswordData changePasswordData = new ChangePasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "changePassword"),
      back: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                BuildChangeForm(changePasswordData: changePasswordData),
              ],
            ),
          ),
          BuildSaveButton(changePasswordData: changePasswordData),
        ],
      ),
    );
  }
}
