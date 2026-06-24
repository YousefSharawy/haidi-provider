part of 'UploadWorkDocumentImports.dart';

class UploadWorkDocumentData {
  final GenericBloc<File?> docImageCubit = GenericBloc(null);
  final TextEditingController doc = TextEditingController();
  final GenericBloc<UploadDocumentModel> uploadDocumentCubit =
      GenericBloc(UploadDocumentModel());
  UploadDocumentModel? data;

  Future<File?> getFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    }
    return null;
  }

  UploadDoc(BuildContext context, String userId) async {
    var file = await getFile();
    if (file != null) {
      docImageCubit.onUpdateData(file);
      uploadDocumentCubit.onUpdateLoader(true);
      data = await GeneralRepository(context).uploadWorkDocument(file.path, userId);
      uploadDocumentCubit.onUpdateData(data!);
      Nav.navigateTo(ActiveAccount(userId: userId),
          navigatorType: NavigatorType.push);
    }
  }
}
