part of 'WorkDatesWImports.dart';


class BuildWorkDateButton extends StatelessWidget {
  final WorkDatesData workDatesData;

  const BuildWorkDateButton({Key? key, required this.workDatesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 40,
      btnKey: workDatesData.btnKey,
      title: tr(context, "confirm"),
      onTap: () =>workDatesData.onRecordTimes(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    );
  }
}
