part of 'GetWorkDocumentImports.dart';

class GetWorkDocumentData {
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<DownloadDocumentModel> downloadDocumentCubit =
      GenericBloc(DownloadDocumentModel());

  DownloadDocumentModel? data;

  void fetchData(BuildContext context) async {
    downloadDocumentCubit.onUpdateLoader(true);
    data = await GeneralRepository(context).getWorkDocument();
    downloadDocumentCubit.onUpdateData(data!);
  }

  Future<void> requestDownload(BuildContext context , String userId) async {
    final String? documentLink = data?.documentLink;
    if (documentLink == null || documentLink.isEmpty) {
      CustomToast.showSimpleToast(msg: tr(context, "errorTryLater"));
      return;
    }

    final String? _localPath = await _findLocalPath();
    if (_localPath == null) {
      CustomToast.showSimpleToast(msg: tr(context, "errorTryLater"));
      return;
    }

    // enqueue() returns a download task id (a UUID), NOT a url.
    // Keep it in a separate variable so we don't overwrite documentLink,
    // otherwise the next download would try to use the task id as the url.
    final String? taskId = await FlutterDownloader.enqueue(
      url: documentLink,
      // headers: {"auth": "test_for_sql_encoding"},
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );

    if (taskId != null) {
      CustomToast.showSimpleToast(msg: tr(context, "downloadingFile"));
      Future.delayed(Duration(milliseconds: 500), () {
        Nav.navigateTo(
            UploadWorkDocument(text: data?.description ?? "", userId: userId),
            navigatorType: NavigatorType.push);
      });
    }
  }

  Future<String?> _findLocalPath() async {
    var externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}

class TaskInfo {
  final String? name;
  String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  TaskInfo({this.name, this.link});
}
