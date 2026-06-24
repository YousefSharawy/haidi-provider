part of 'ServiceWImports.dart';

class BuildEditServiceSuccessDialog extends StatelessWidget {
  const BuildEditServiceSuccessDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.button,
      alertTextType: AlertContentType.title,
      alertImageType: AlertImageType.success,
      headTitle: tr(context, "dataEditedReviewDash"),
      buttonTitle: tr(context, "back"),
      onTapButton: () =>  navigationKey.currentState!.pop(),
    );
  }
}
