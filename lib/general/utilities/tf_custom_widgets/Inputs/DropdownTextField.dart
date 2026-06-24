import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'custom_dropDown/CustomDropDown.dart';

class DropdownTextField<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final String? searchHint;
  final DataType? selectedItem;
  final Widget? prefixIcon;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final double? textSize;
  final String Function(dynamic) itemAsString;
  final dynamic validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? arrowBtnPadding;
  final EdgeInsets? clearBtnPadding;
  final EdgeInsets? contentPadding;
  final bool useName;
  final Color? enableColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? buttonsColor;
  final BorderRadius? radius;

  DropdownTextField(
      {this.label,
        this.hint,
        this.margin,
        required this.validate,
        this.contentPadding,
        this.prefixIcon,
        this.clearBtnPadding,
        this.arrowBtnPadding,
        this.useName = true,
        this.searchHint,
        required this.itemAsString,
        this.onChange,
        this.fontSize,
        this.textSize,
        this.labelSize,
        this.hintColor,
        this.fillColor,
        this.buttonsColor,
        this.finData,
        this.dropKey,
        this.data,
        this.enableColor,
        this.selectedItem,
        this.radius,
        this.showSelectedItem = false});

  @override
  _DropdownTextFieldState<DataType> createState() =>
      _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: false,
        maxHeight: 350,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: true,
        clearButton: Padding(
          padding: widget.clearBtnPadding??const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.clear, size: 20,color: widget.buttonsColor?? Colors.black),
        ),
        dropDownButton: Padding(
          padding: widget.arrowBtnPadding??const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.arrow_drop_down, size: 24,color: widget.buttonsColor?? Colors.black),
        ),
        selectedItem: widget.selectedItem,
        itemAsString: widget.itemAsString,
        showSelectedItem: widget.showSelectedItem,
        style: WidgetUtils.textStyle.copyWith(fontSize: widget.textSize??WidgetUtils.textStyle.fontSize,color:Theme.of(context).textTheme.titleMedium?.color),
        searchBoxStyle: WidgetUtils.textStyle,
        searchBoxDecoration: WidgetUtils.setInputDecoration(
            hint: widget.searchHint??"بحث",
            enableColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)
        ),
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: WidgetUtils.primaryColor,
          ),
          child: Center(
            child: MyText(
              title: widget.label!=null?widget.label!:widget.hint!,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        dropdownSearchDecoration:  WidgetUtils.setInputDecoration(
            hintColor: widget.hintColor,
            label: widget.label,
            hint: widget.hint,
            fillColor: widget.fillColor,
            enableColor: widget.enableColor,
            radius: widget.radius,
            prefixIcon: widget.prefixIcon,
            padding: widget.contentPadding?? EdgeInsets.symmetric(horizontal: 10, vertical: 12)
        ),
      ),
    );
  }
}
