import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../MyApp.dart';


class CustomModal extends StatelessWidget {
  final Widget content;
  final String title;

  const CustomModal(
      {required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Text(
            title,
            style: DioUtils.textStyle.copyWith(fontSize: 12),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () => navigationKey.currentState!.pop(),
          ),
          backgroundColor: DioUtils.primaryColor,
        ),
        child: SafeArea(
          bottom: false,
          child: content,
        ),
      ),
    );
  }
}
