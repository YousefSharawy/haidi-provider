import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading {

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitCubeGrid(
        color: color?? WidgetUtils.primaryColor,
        size: 40.0,
      ),
    );
  }
}
