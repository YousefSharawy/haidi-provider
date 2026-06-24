import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomInputDecoration extends InputDecoration {
  final String lang;
  final String? labelTxt;
  final String? hintTxt;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? enableColor;
  final Color? focusColor;
  final Color? hintColor;
  final Color? customFillColor;
  final BorderRadius? borderRaduis;
  final EdgeInsets? padding;

  CustomInputDecoration(
      {required this.lang,
      String? hint,
      this.labelTxt,
      this.prefixIcon,
      this.suffixIcon,
      this.hintColor,
      this.customFillColor,
      this.enableColor,
      this.focusColor,
      this.borderRaduis,
      this.padding})
      : hintTxt = hint,
        super();

  @override
  // TODO: implement enabledBorder
  InputBorder get enabledBorder => OutlineInputBorder(
        borderSide:
            BorderSide(color: enableColor ?? MyColors.greyWhite, width: .7),
        borderRadius: borderRaduis??BorderRadius.circular(15),
      );

  @override
  // TODO: implement focusedBorder
  InputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: borderRaduis??BorderRadius.circular(15),
      borderSide: BorderSide(color: focusColor ?? MyColors.primary, width: 1));

  @override
  // TODO: implement errorBorder
  InputBorder get errorBorder => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: .5),
      borderRadius: borderRaduis??BorderRadius.circular(15));

  @override
  // TODO: implement focusedErrorBorder
  InputBorder get focusedErrorBorder => OutlineInputBorder(
      borderRadius: borderRaduis??BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.red, width: 2));

  @override
  // TODO: implement errorStyle
  TextStyle get errorStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 12)
      : GoogleFonts.cairo(fontSize: 10);

  @override
  // TODO: implement hintText
  String? get hintText => hintTxt;

  @override
  // TODO: implement label
  Widget? get label => labelTxt==null?super.label:Text(labelTxt??"",style: labelStyle);

  @override
  // TODO: implement labelStyle
  TextStyle get labelStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 11, color: hintColor ?? Colors.black54)
      : GoogleFonts.cairo(fontSize: 12, color: hintColor ?? Colors.black54);

  @override
  // TODO: implement hintStyle
  TextStyle? get hintStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 11, color: hintColor ?? Colors.black54)
      : GoogleFonts.cairo(fontSize: 12, color: hintColor ?? Colors.black54);

  @override
  // TODO: implement contentPadding
  EdgeInsetsGeometry get contentPadding =>
      padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 14);

  @override
  // TODO: implement filled
  bool get filled => true;

  @override
  // TODO: implement fillColor
  Color get fillColor => customFillColor ?? Colors.transparent;

  @override
  // TODO: implement alignLabelWithHint
  bool get alignLabelWithHint => true;
}
