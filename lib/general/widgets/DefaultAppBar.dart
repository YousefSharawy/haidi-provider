import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';

import '../MyApp.dart';


class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? size;

  DefaultAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(

        title: MyText(
            title: "$title",
            size: 14,
            fontWeight: FontWeight.bold,
            color: MyColors.white),
        centerTitle: true,
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading:
          leading ??
              IconButton(
                  icon:
                      Icon(Icons.arrow_back, size: 25, color: MyColors.primary),
                  onPressed: () => navigationKey.currentState!.pop()),
        actions: actions);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
