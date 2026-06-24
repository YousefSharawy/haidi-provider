part of 'SelectLangWidgetsImports.dart';


class BuildButtonList extends StatelessWidget {
  final SelectLangData selectLangData;

  const BuildButtonList({required this.selectLangData});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => selectLangData.setUserLang(context, "ar"),
          child: Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(100)),
              border:
              Border.all(color: MyColors.primary, width: 1.7),
            ),
            child: Center(
              child: MyText(
                  title: tr(context, "langAr"),
                  size: 13,
                  color: MyColors.primary),
            ),
          ),
        ),
        SizedBox(width: 35),
        InkWell(
          onTap: ()=>selectLangData.setUserLang(context, "en"),
          child: Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border:
              Border.all(color: MyColors.primary, width: 1.5),
            ),
            child: Center(
              child: MyText(
                  title: tr(context, "langEn"),
                  size: 13,
                  color: MyColors.primary),
            ),
          ),
        )
      ],
    );
  }
}
