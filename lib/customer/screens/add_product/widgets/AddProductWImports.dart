import 'dart:io';

import 'package:base_flutter/customer/models/main_cat_model.dart';
import 'package:base_flutter/customer/models/primary_features.dart';
import 'package:base_flutter/customer/models/product_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/add_product/AddProductImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/DropDownModel.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/LoadingButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

part 'BuildProductPic.dart';
part 'BuildAddProductFormInputs.dart';
part 'BuildBasicFeatureInput.dart';
part 'addProductBtn.dart';