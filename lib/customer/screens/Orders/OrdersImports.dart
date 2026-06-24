
import 'dart:developer';

import 'package:base_flutter/customer/models/OrderModel.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/Orders/widgets/OrderWidgetImports.dart';
import 'package:base_flutter/customer/screens/order_details/OrderDetailsImports.dart';
import 'package:base_flutter/customer/widgets/BuildOrdersCartItem.dart';
import 'package:base_flutter/general/MyApp.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';


part 'Orders.dart';
part 'OrdersData.dart';