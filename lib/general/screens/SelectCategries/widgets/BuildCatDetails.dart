
part of'SelectCatWImports.dart';

class BuildCatDetails extends StatelessWidget {
  const BuildCatDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderLogo(),
        MyText(
          alien: TextAlign.center,
          title: tr(context, "register"),
          size: 13,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        const SizedBox(height: 10),
        MyText(
          alien: TextAlign.center,
          title: tr(context, "appSections"),
          size: 15,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        const SizedBox(height: 40),
        MyText(
          alien: TextAlign.start,
          title: tr(context, "appSections"),
          size: 10,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
      ],
    );
  }
}
