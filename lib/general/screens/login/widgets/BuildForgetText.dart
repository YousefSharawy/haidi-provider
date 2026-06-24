part of 'LoginWidgetsImports.dart';

class BuildForgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => Nav.navigateTo(
          ForgetPassword(),
          navigatorType: NavigatorType.push,
          duration: Duration(seconds: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              title: tr(context, "forgetPassword"),
              size: 11,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: MyColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
