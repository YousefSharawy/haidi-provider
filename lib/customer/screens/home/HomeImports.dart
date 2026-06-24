
import 'dart:developer';

import 'package:base_flutter/customer/models/HomeModel.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/home/widgets/HomeWidgetImports.dart';
import 'package:base_flutter/customer/screens/notification/NotificationsWImports.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/HeaderLogo.dart';
import 'package:base_flutter/general/widgets/Logo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/constants/GlobalNotification.dart';




part 'Home.dart';

part 'HomeData.dart';
