part of 'ResetPasswordImports.dart';

class ResetPassword extends StatefulWidget {
  final String userId;

  const ResetPassword({required this.userId});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordData resetPasswordData = ResetPasswordData();

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
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: ListView(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
              physics:const BouncingScrollPhysics(),
              children: [
                BuildResetPassLogo(),
                BuildText(),
                BuildFormInputs(
                  resetPasswordData: resetPasswordData,
                  userId: widget.userId,
                ),
                BuildButton(
                  resetPasswordData: resetPasswordData,
                  userId: widget.userId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

