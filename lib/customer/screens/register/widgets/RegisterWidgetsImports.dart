import 'dart:io';

import 'package:base_flutter/customer/models/cities_models.dart';
import 'package:base_flutter/customer/models/cities_models.dart';
import 'package:base_flutter/customer/screens/register/RegisterImports.dart';
import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/resources/GeneralRepoImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/screens/terms/TermsImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/validator/Validator.dart';

import '../../../../general/MyApp.dart';
import '../../../../general/screens/active_account/ActiveAccountImports.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import '../../../../general/utilities/utils_functions/Navigator.dart';

part 'BuildRegisterInputs.dart';
part 'BuildRegisterPic.dart';
part 'BuildRegisterButton.dart';
part 'BuildHaveAccount.dart';
part 'BuildText.dart';
part 'BuildLogoPic.dart';
part 'BuildTaxPic.dart';
part 'BuildTradePic.dart';
