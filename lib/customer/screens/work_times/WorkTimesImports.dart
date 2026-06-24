
import 'dart:developer';

import 'package:base_flutter/customer/models/work_time_model.dart';
import 'package:base_flutter/customer/screens/get_work_document/GetWorkDocumentImports.dart';
import 'package:base_flutter/customer/screens/work_times/widgets/WorkTimeWImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/resources/GeneralRepoImports.dart';
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart';
import 'package:base_flutter/general/screens/login/LoginImports.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/HeaderLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/validator/Validator.dart';

part 'WorkTimesData.dart';
part 'WorkTimes.dart';