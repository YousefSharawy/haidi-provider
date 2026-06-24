part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
            ListView(
              padding:
              const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
              children: [
                BuildRegisterPic(registerData: registerData),
                BuildText(),
                BuildRegisterInputs(registerData: registerData),
                BuildRegisterButton(registerData: registerData),
                BuildHaveAccount()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

