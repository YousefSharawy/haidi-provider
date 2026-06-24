part of 'SelectLangImports.dart';

class SelectLang extends StatefulWidget {
  @override
  _SelectLangState createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  SelectLangData selectLangData = SelectLangData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: selectLangData.onBackPressed,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Res.background,
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  Res.background,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildLangLogo(),
                BuildButtonList(selectLangData: selectLangData),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
