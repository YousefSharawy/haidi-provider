part of 'ResetPasswordWidgetsImports.dart';

class BuildResetPassLogo extends StatelessWidget {
  const BuildResetPassLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () => navigationKey.currentState!.pop(),
            child: Icon(Icons.arrow_back_ios, color: MyColors.primary)),
        Hero(
            tag: 'logo',
            child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
                child: Image.asset(Res.imagesLogo))),
      ],
    );
  }
}
