import 'dart:developer';

import 'package:base_flutter/customer/models/cities_models.dart';
import 'package:base_flutter/customer/models/entities/add_service_dots.dart';
import 'package:base_flutter/customer/models/main_cat_model.dart';
import 'package:base_flutter/customer/models/services_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/Services/widgets/ServiceWImports.dart';
import 'package:base_flutter/customer/screens/store/widgets/StoreWImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:base_flutter/general/widgets/GeneralAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/MyApp.dart';

part 'Services.dart';
part 'ServicesData.dart';