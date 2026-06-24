part of 'ChangePassWidgetsImports.dart';

class BuildSaveButton extends StatelessWidget {

  final ChangePasswordData changePasswordData;

  const BuildSaveButton({required this.changePasswordData});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
        onTap: () => changePasswordData.setChangePassword(context),
        title: tr(context, "confirm"),
        margin: EdgeInsets.zero,
        height: 50,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)));
  }
}
