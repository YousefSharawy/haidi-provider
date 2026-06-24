part of'WorkTimeWImports.dart';

class BuildWorkTimeLogo extends StatelessWidget {
  final WorkTimesData workTimesData;
  const BuildWorkTimeLogo({
    Key? key,
    required this.workTimesData,
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
          title: tr(context, "workHours"),
          size: 15,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
      ],
    );
  }
}
