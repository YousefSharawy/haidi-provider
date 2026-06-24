import 'package:base_flutter/res/res.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Image.asset(
        Res.imagesLogo,
        fit: BoxFit.scaleDown,
        scale: 1,
      ),
    );
  }
}
