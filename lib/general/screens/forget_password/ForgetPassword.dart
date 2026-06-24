part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgerPasswordData forgerPasswordData = new ForgerPasswordData();

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
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
              physics: NeverScrollableScrollPhysics(),
              children: [
                BuildForgetPassLogo(),
                BuildText(),
                BuildFormInputs(forgerPasswordData: forgerPasswordData),
                BuildButton(forgerPasswordData: forgerPasswordData),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

