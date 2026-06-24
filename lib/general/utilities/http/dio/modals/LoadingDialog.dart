import 'package:animations/animations.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../MyApp.dart';

class CustomToast{

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "تأكيد");
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
            DioUtils.authSentence??"قم بتسجيل الدخول للمتابعة",
            DioUtils.onAuthClick,
            context,
            DioUtils.authConfirm??"دخول");
      },
    );
  }

  

  static Widget _alertDialog(
      String title, Function()? confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: DioUtils.textStyle.copyWith(
          color: Colors.black,
        ),
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: Text(
            DioUtils.authBack??"رجوع",
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: () => navigationKey.currentState!.pop(),
        ),
        CupertinoDialogAction(
          child: Text(
            okText,
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: confirm,
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSimpleToast(
      {required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static navigateToDialog(BuildContext context, TickerProviderStateMixin tickerProviderStateMixin, Widget widget,{bool? barrierDismissible}) {
    showModal(
        configuration:  FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 700,),
            barrierDismissible: barrierDismissible??true
        ),
        context: context,
        builder: (context) =>widget);
  }
}
