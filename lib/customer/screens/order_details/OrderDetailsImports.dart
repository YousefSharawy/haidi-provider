
import 'package:base_flutter/customer/models/OrderDetailsModel.dart';
import 'package:base_flutter/customer/models/service_order_details_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/order_details/widgets/OrderDetailsWImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/LoadingButton.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/MyApp.dart';

part 'OrderDetails.dart';
part 'OrderDetailsData.dart';