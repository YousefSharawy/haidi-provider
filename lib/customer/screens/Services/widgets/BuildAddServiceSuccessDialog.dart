part of 'ServiceWImports.dart';

class BuildAddServiceSuccessDialog extends StatelessWidget {
  const BuildAddServiceSuccessDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.button,
      alertTextType: AlertContentType.title,
      alertImageType: AlertImageType.success,
      headTitle: tr(context, "dataEnteredReviewDash"),
      buttonTitle: tr(context, "back"),
      onTapButton: () =>  navigationKey.currentState!.pop(),
    );
  }
}
