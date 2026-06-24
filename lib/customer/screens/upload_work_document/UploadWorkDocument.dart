part of 'UploadWorkDocumentImports.dart';

class UploadWorkDocument extends StatefulWidget {
  UploadWorkDocument({Key? key, required this.text, required this.userId}) : super(key: key);
  final String text;
  final String userId;

  @override
  State<UploadWorkDocument> createState() => _UploadWorkDocumentState();
}

class _UploadWorkDocumentState extends State<UploadWorkDocument> {
  final uploadWorkDocumentData = UploadWorkDocumentData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildUploadWorkDocumentLogo(),
            BuildUploadWorkDocumentText(
              text: widget.text,
            ),
            BuildUploadDocPic(uploadWorkDocumentData: uploadWorkDocumentData , userId: widget.userId,),
          ],
        ),
      ),
    );
  }
}
