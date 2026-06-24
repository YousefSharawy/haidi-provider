import 'dart:developer';
import 'dart:io';

import 'package:base_flutter/customer/models/entities/add_product_dots.dart';
import 'package:base_flutter/customer/models/main_cat_model.dart';
import 'package:base_flutter/customer/models/primary_features.dart';
import 'package:base_flutter/customer/models/product_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/add_product/widgets/AddProductWImports.dart';
import 'package:base_flutter/customer/screens/store/widgets/StoreWImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/DropDownModel.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/validator/Validator.dart';

import '../../../general/MyApp.dart';

part 'AddProduct.dart';
part 'AddProductData.dart';