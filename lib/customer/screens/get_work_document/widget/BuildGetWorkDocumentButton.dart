part of 'GetWorkDocumentWidgetImports.dart';

class BuildGetWorkDocumentButton extends StatelessWidget {
  BuildGetWorkDocumentButton({Key? key, required this.getWorkDocumentData, required this.userId})
      : super(key: key);

  final String userId;

  final GetWorkDocumentData getWorkDocumentData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: LoadingButton(
        borderRadius: 40,
        btnKey: getWorkDocumentData.btnKey,
        title: tr(context, "downloadDocument"),
        onTap: ()=>getWorkDocumentData.requestDownload(context , userId),
        color: MyColors.primary,
        textColor: MyColors.white,
        margin: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
