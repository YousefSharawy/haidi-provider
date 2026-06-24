part of 'profileWidgetImports.dart';

class BuildProfileButtons extends StatelessWidget {
  final ProfileData profileData;
  const BuildProfileButtons({Key? key, required this.profileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: ()=>Nav.navigateTo(ChangePassword(),
                navigatorType: NavigatorType.push),
            child: MyText(
              title: tr(context, "changePassword"),
              size: 11,
              color: MyColors.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          LoadingButton(
            title:tr(context, "save"),
            onTap: () => profileData.saveUserProfile(context),
            color: MyColors.primary,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
            btnKey: profileData.btnKey,
          )
        ],
      ),
    );
  }
}
