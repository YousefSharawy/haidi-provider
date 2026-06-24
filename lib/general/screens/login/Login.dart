part of 'LoginImports.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              physics: const BouncingScrollPhysics(),
              children: [
                BuildHomeLogo(),
                BuildText(),
                BuildFormInputs(loginData: loginData),
                SizedBox(height: 5),
                BuildLoginButton(loginData: loginData),
                BuildForgetText(),
                BuildNewRegister(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

