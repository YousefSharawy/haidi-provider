part of 'SplashImports.dart';

class Splash extends StatefulWidget {
  const Splash();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData() async {
    if (!kIsWeb) {
      setupNotifications(context);
    }
    Future.delayed(Duration(milliseconds: 2000), () {
      Utils.manipulateSplashData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(
              child: Hero(
                  tag: 'logo',
                  child: Image.asset(Res.imagesLogo,
                      width: double.infinity, fit: BoxFit.fill))),
        ],
      ),
    );
  }
}
