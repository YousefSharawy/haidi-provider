part of 'SelectLangWidgetsImports.dart';

class BuildLangLogo extends StatelessWidget {
  const BuildLangLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(tag: 'logo',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(Res.imagesLogo),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        MyText(
            title: tr(context, "chooseLang"), size: 15, color: MyColors.black),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
