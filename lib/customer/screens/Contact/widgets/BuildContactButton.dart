part of 'ContactWidgetImports.dart';

class BuildContactButton extends StatelessWidget {
  final ContactData contactData ;
  const BuildContactButton({Key? key, required this.contactData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: contactData.btnKey,
      title: tr(context, "send"),
      onTap: () =>contactData.contactUs(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
