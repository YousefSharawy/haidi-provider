part of 'ForgetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildButton({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 40,
      btnKey: forgerPasswordData.btnKey,
      title: tr(context, "continue"),
      onTap: () => forgerPasswordData.onForgetPassword(context),
      color: MyColors.primary,
      margin: const EdgeInsets.symmetric(vertical: 18),
    );
  }
}
