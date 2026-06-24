import 'dart:async';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';

import 'multi_drop_down/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'multi_drop_down/chip_display/multi_select_chip_display.dart';
import 'multi_drop_down/util/multi_select_list_type.dart';

class MultiDropDownField<T> extends StatefulWidget {
  final List<T>? data;
  final List<T> selectedItems;
  final String title;
  final String label;
  final Color? fillColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unSelectedTextColor;
  final Color? buttonsColor;
  final Color? chipColor;
  final Color? textColor;
  final Color? itemsTextColor;
  final Color? titleColor;
  final Function(List<T>?) onConfirm;
  final Function(T) onItemClick;
  final Future<List<T>> Function()? onFind;
  final GlobalKey<FormFieldState>? dropkey;

  const MultiDropDownField({
    this.data,
    required this.selectedItems,
    required this.title,
    required this.label,
    this.fillColor,
    this.borderColor,
    required this.onConfirm,
    required this.onItemClick,
    this.onFind,
    this.dropkey,
    this.textColor,
    this.buttonsColor,
    this.selectedTextColor,
    this.unSelectedTextColor,
    this.selectedColor,
    this.chipColor,
    this.backgroundColor,
    this.unselectedColor,
    this.titleColor,
    this.itemsTextColor,
  });

  @override
  _MultiDropDownField2State<T> createState() => _MultiDropDownField2State<T>();
}

class _MultiDropDownField2State<T> extends State<MultiDropDownField<T>> {
  @override
  Widget build(BuildContext context) {
    return MultiSelectBottomSheetField<T>(
      initialChildSize: 0.5,
      key: widget.dropkey,
      listType: MultiSelectListType.CHIP,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      searchable: true,
      searchHint: WidgetUtils.lang=="ar"? "بحث" : "Search",
      selectedColor: widget.selectedColor ?? WidgetUtils.primaryColor,
      unselectedColor: widget.unselectedColor ?? Colors.grey[200],
      selectedTextColor: widget.selectedTextColor ?? Colors.white,
      unSelectedTextColor: widget.unSelectedTextColor ?? Colors.black,
      itemsTextStyle: WidgetUtils.textStyle.copyWith(color: widget.itemsTextColor??Colors.white70),
      buttonText: Text(
        widget.label,
        style: WidgetUtils.textStyle.copyWith(
          fontSize: 14,
          color: widget.textColor??Colors.black45,
        ),
      ),
      title: MyText(
        title: widget.title,
        color: widget.titleColor??Colors.black45,
        size: 12,
      ),
      decoration: BoxDecoration(
        color: widget.fillColor ?? Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: widget.borderColor ?? Colors.grey.withOpacity(.5),
          width: 1.5,
        ),
      ),
      items: widget.data ?? [],
      onFind: widget.onFind,
      onConfirm: widget.onConfirm,
      initialValue: widget.selectedItems,
      buttonIcon: Icon(
        Icons.arrow_drop_down,
        size: 25,
        color: widget.textColor??Colors.black45,
      ),
      confirmText: Text(
        WidgetUtils.lang=="ar"? "تاكيد" :"Confirm",
        style: WidgetUtils.textStyle.copyWith(
          color: widget.buttonsColor ?? WidgetUtils.primaryColor,
        ),
      ),
      cancelText: Text(
        WidgetUtils.lang=="ar"? "الغاء" :"Cancel",
        style: WidgetUtils.textStyle.copyWith(
          color: widget.buttonsColor ?? WidgetUtils.primaryColor,
        ),
      ),
      chipDisplay: MultiSelectChipDisplay(
        alignment:
            WidgetUtils.lang == "ar" ? Alignment.topRight : Alignment.topLeft,
        chipColor: widget.chipColor,
        textStyle: WidgetUtils.textStyle
            .copyWith(color: widget.selectedTextColor ?? Colors.white),
        onTap: widget.onItemClick,
      ),
      validator: (values) {
        if (values == null || values.isEmpty) {
          return WidgetUtils.lang=="ar"? "اختر عنصر واحد علي الاقل" : "select at least one";
        }
        return null;
      },
    );
  }
}
