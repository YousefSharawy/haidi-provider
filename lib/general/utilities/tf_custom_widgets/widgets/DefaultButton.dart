import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

import 'MyText.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final FontWeight? fontWeight;

  DefaultButton({
    required this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    Color border = color ?? WidgetUtils.primaryColor;
    return IgnorePointer(
      ignoring: disabled??false,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height??45,
        margin: margin ?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ElevatedButton(
          onPressed: onTap,
          child: MyText(
            title: "$title",
            size: fontSize??11,
            color: textColor ?? Colors.white,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? WidgetUtils.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(10),
                  side: BorderSide(color: borderColor ?? border, width: 1),
              ),
              elevation: elevation??0,
          ),
        ),
      ),
    );
  }
}
