part of 'change_language_imports.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage();

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  final ChangeLanguageData changeLanguageData = ChangeLanguageData();

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(
          title: tr(context, "lang"),
          actions: [],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: tr(context, "lang"), size: 14, color: MyColors.primary),
              PopupMenuButton<String>(
                itemBuilder: (context) {
                  return ["${tr(context, "langEn")}", "${tr(context, "langAr")}"].map((str) {
                    return PopupMenuItem(
                      value: str,
                      child: MyText(
                        title: str.toString(),
                        color: MyColors.primary,
                        size: 10,
                        fontWeight: FontWeight.normal,
                      ),
                      onTap: () {
                        changeLanguageData.lang.text = str;
                      },
                    );
                  }).toList();
                },
                enabled: true,
                elevation: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText(
                      title: changeLanguageData.lang.text,
                      size: 14,
                      color: Color(0xffB9A5A4),
                      fontWeight: FontWeight.normal,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 25,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                onSelected: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
          child: Divider(thickness: 1),
        )
      ],
      bottom: DefaultButton(
          onTap: () {},
          title: tr(context, "confirm"),
          margin: EdgeInsets.zero,
          height: 50,
          fontSize: 14,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    );
  }
}
