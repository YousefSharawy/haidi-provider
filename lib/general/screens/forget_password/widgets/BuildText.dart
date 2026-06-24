part of 'ForgetPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20,top: 20),
      child: MyText(
        alien: TextAlign.center,
        title: tr(context, "getPassword"),
        size: 13,
        color: MyColors.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
