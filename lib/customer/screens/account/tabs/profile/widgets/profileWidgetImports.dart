
import 'dart:developer';
import 'dart:io';


import 'package:base_flutter/customer/models/cities_models.dart';
import 'package:base_flutter/customer/screens/account/tabs/profile/ProfileImports.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:base_flutter/general/resources/GeneralRepoImports.dart';
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/LoadingButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/tf_validator.dart';

part 'BuildProfileBody.dart';
part 'BuildProfileButtons.dart';
part 'BuildProviderProfilePhoto.dart';
part 'BuildTradePic.dart';
part 'BuildTaxPic.dart';
part 'BuildLogoPic.dart';