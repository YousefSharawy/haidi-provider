import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:base_flutter/customer/screens/get_work_document/widget/GetWorkDocumentWidgetImports.dart';
import 'package:base_flutter/customer/screens/upload_work_document/UploadWorkDocumentImports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/resources/GeneralRepoImports.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../models/download_document_model.dart';

part 'GetWorkDocumentData.dart';
part 'GetWorkDocument.dart';