part of 'GetWorkDocumentImports.dart';

class GetWorkDocument extends StatefulWidget {
  GetWorkDocument({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<GetWorkDocument> createState() => _GetWorkDocumentState();
}

class _GetWorkDocumentState extends State<GetWorkDocument> {
  final getWorkDocumentData = GetWorkDocumentData();

  @override
  void initState() {
    getWorkDocumentData.fetchData(context);
    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, int status, int progress) {
    log('Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    log("=========progress==========> $progress");
    send!.send([id, status, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildGetWorkDocumentLogo(),
            BuildGetWorkDocumentText(
              getWorkDocumentData: getWorkDocumentData,
            ),
            BuildGetWorkDocumentButton(
              getWorkDocumentData: getWorkDocumentData,
              userId: widget.userId,
            ),
          ],
        ),
      ),
    );
  }
}
