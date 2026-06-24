import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/res/res.dart';
import 'package:flutter/material.dart';

enum AlertButtonType { noButton, button, dueButton }

enum AlertContentType { fullTitle, title, noTitle }

enum AlertImageType { warning, success, noImg }

class GeneralAlertDialog extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? customWidget;
  final Widget? alertTextChild;
  final String? buttonTitle;
  final String? rightButtonTitle;
  final String? leftButtonTitle;
  final String? subTitle;
  final String? headTitle;
  final AlertButtonType alertButtonType;
  final AlertContentType alertTextType;
  final AlertImageType alertImageType;
  final Function()? onTapRightButton;
  final Function()? onTapLeftButton;
  final Function()? onTapButton;

  const GeneralAlertDialog({
    Key? key,
    this.onTapRightButton,
    this.onTapLeftButton,
    required this.alertButtonType,
    required this.alertTextType,
    required this.alertImageType,
    this.subTitle,
    this.headTitle,
    this.onTapButton,
    this.buttonTitle,
    this.rightButtonTitle,
    this.leftButtonTitle,
    this.alertTextChild,
    this.customWidget,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customWidget ?? Container(),
            Builder(builder: (context) {
              if (alertImageType == AlertImageType.success) {
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      Res.imagesCheckmark,
                      scale: 3,
                    ));
              } else if(alertImageType == AlertImageType.success){
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: alertImageType == AlertImageType.warning
                        ? Image.asset(
                            Res.imagesClose,
                            scale: 3,
                          )
                        : const SizedBox());
              }else {
                return const SizedBox();
              }
            }),
            Builder(builder: (context){
              if(alertTextType == AlertContentType.noTitle){
                return alertTextChild ?? const SizedBox() ;
              }else if(alertTextType == AlertContentType.title){
               return Column(
                  children: [
                    Container(
                      child: Visibility(
                        visible: alertTextType == AlertContentType.title,
                        child: MyText(
                          alien: TextAlign.center,
                          title: headTitle ?? '',
                          color: Colors.black,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }else if(alertTextType == AlertContentType.fullTitle){
                return Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          MyText(
                            alien: TextAlign.center,
                            title: headTitle ?? '',
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            alien: TextAlign.center,
                            title: subTitle ?? '',
                            color: Colors.grey,
                            size: 11,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }else{
                return const SizedBox();
              }
            }),
            if (alertButtonType == AlertButtonType.noButton) Container(),
            if (alertButtonType == AlertButtonType.button)
              DefaultButton(
                margin: const EdgeInsets.only(top: 10),
                title: buttonTitle ?? '',
                onTap: onTapButton ?? () {},
              ),
            if (alertButtonType == AlertButtonType.dueButton)
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: DefaultButton(
                        title: rightButtonTitle ?? '',
                        onTap: onTapRightButton ?? () {},
                      ),
                    ),
                    Expanded(
                      child: DefaultButton(
                        color: Colors.white,
                        textColor: MyColors.black.withOpacity(.7),
                        borderColor: MyColors.greyWhite.withOpacity(.5),
                        title: leftButtonTitle ?? '',
                        onTap: onTapLeftButton ?? () {},
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
