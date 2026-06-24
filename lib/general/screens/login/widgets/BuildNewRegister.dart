part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title: tr(context, "don'tHaveAccount"),
              size: 11,
              alien: TextAlign.center,
              color: MyColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => Nav.navigateTo(
              const Register(),
              navigatorType: NavigatorType.push,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MyText(
                title: tr(context, "register"),
                size: 11,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: MyColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
