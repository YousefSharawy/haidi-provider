import 'dart:io';

import 'package:base_flutter/customer/screens/upload_work_document/widget/UploadDocumentWidgetImports.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../general/resources/GeneralRepoImports.dart';
import '../../../general/screens/active_account/ActiveAccountImports.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../models/download_document_model.dart';
import '../../models/upload_document_model.dart';

part 'UploadWorkDocument.dart';
part 'UploadWorkDocumentData.dart';