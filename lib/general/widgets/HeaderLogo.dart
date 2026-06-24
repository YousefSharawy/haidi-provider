import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/res/res.dart';
import 'package:flutter/material.dart';

import '../MyApp.dart';


class HeaderLogo extends StatelessWidget {
  final bool back  ;

  const HeaderLogo({super.key,  this.back= true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        back? Padding(
          padding: const EdgeInsets.only(top: 40),
          child: InkWell(
              onTap: () => navigationKey.currentState!.pop(),
              child: Icon(Icons.arrow_back_ios,color: MyColors.primary,)),
        ):const SizedBox(),
        Center(
          child: InkWell(
            onTap: () {
              // Utils.changeAppTheme(context);
            },
            child: Container(
              height: 90,
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                Res.imagesLogo,
                fit: BoxFit.scaleDown,
                scale: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
