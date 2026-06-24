part of 'RegisterWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: MyText(
          title: tr(context, "register"),
          size: 16,
          color: MyColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
