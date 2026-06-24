import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/res/res.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  final List<Widget> children;
  final Widget? bottom;

  const HomeScaffold({
    required this.children,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom,
      backgroundColor: MyColors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Res.imagesLogo), fit: BoxFit.fill),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
