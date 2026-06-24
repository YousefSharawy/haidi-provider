import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final bool autoFocus;
  final int? max;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final TextInputType type;
  final TextInputAction action;
  final BorderRadius? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function()? onTab;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final int? maxLength;
  final Function(String? value) validate;
  final FieldTypes fieldTypes;
  final Function()? onSubmit;
  final Function(String)? onChange;

  GenericTextField(
      {this.label,
      this.hint,
      required this.fieldTypes,
      this.controller,
      this.focusNode,
      this.margin,
      this.autoFocus = false,
      this.contentPadding,
      required this.type,
      this.onTab,
      this.radius,
      this.max,
      this.maxLength,
      this.suffixWidget,
      this.prefixWidget,
      this.textColor,
      this.fillColor,
      this.hintColor,
      this.prefixIcon,
      this.suffixIcon,
      this.onChange,
      this.onSubmit,
      required this.action,
      this.enableBorderColor,
      this.focusBorderColor,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: Visibility(
        visible: fieldTypes == FieldTypes.clickable,
        child: buildClickableView(context),
        replacement: buildFormFiled(context),
      ),
    );
  }

  Widget buildClickableView(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: AbsorbPointer(
        absorbing: true,
        child: buildFormFiled(context),
      ),
    );
  }

  Widget buildFormFiled(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      textInputAction: action,
      enableSuggestions: false,
      autocorrect: false,
      autofocus: autoFocus,
      focusNode: focusNode,
      inputFormatters: [
        if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
        //n is maximum number of characters you want in textfield
      ],
      enabled: fieldTypes != FieldTypes.disable,
      autofillHints: getAutoFillHints(type),
      maxLines: fieldTypes == FieldTypes.chat
          ? null
          : fieldTypes == FieldTypes.rich
              ? max
              : 1,
      obscureText: fieldTypes == FieldTypes.password,
      readOnly: fieldTypes == FieldTypes.readonly,
      onEditingComplete: onSubmit,
      onChanged: onChange,
      validator: (value) => validate(value),
      style: TextStyle(
          color: textColor ?? Theme.of(context).textTheme.titleMedium?.color,
          fontSize: 12),
      // style: WidgetUtils.textStyle.copyWith(color: textColor??WidgetUtils.textStyle.color),
      decoration: WidgetUtils.setInputDecoration(
        label: label,
        hint: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enableColor: enableBorderColor,
        focusBorderColor: focusBorderColor,
        fillColor: MyColors.secondary,
        padding: contentPadding,
        hintColor: hintColor ?? Theme.of(context).textTheme.titleMedium?.color,
        radius: radius??BorderRadius.circular(50),
        prefixWidget: prefixWidget,
        suffixWidget: suffixWidget,
      ),
    );
  }

  List<String> getAutoFillHints(TextInputType inputType) {
    if (inputType == TextInputType.emailAddress) {
      return [AutofillHints.email];
    } else if (inputType == TextInputType.datetime) {
      return [AutofillHints.birthday];
    } else if (inputType == TextInputType.phone) {
      return [AutofillHints.telephoneNumber];
    } else if (inputType == TextInputType.url) {
      return [AutofillHints.url];
    }
    return [AutofillHints.name, AutofillHints.username];
  }
}

enum FieldTypes { normal, clickable, readonly, chat, password, rich, disable }
