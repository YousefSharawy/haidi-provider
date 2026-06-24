part of 'RegisterWidgetsImports.dart';

class BuildHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title: tr(context, "haveAccount"),
              size: 11,
              alien: TextAlign.center,
              color: MyColors.blackOpacity,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => navigationKey.currentState!.pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MyText(
                title: tr(context, "loginn"),
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
