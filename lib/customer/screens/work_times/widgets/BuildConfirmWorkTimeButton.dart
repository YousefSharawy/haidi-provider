part of 'WorkTimeWImports.dart';

class BuildConfirmWorkTimeButton extends StatelessWidget {
  const BuildConfirmWorkTimeButton({
    Key? key,
    required this.workTimesData,
    required this.widget,
  }) : super(key: key);

  final WorkTimesData workTimesData;
  final WorkTimes widget;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 40,
      btnKey: workTimesData.btnKey,
      title: tr(context, "confirm"),
      onTap: () =>workTimesData.onRecordTimes(context, widget.providerId),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
