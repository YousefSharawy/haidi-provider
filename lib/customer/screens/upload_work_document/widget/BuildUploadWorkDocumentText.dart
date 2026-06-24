part of 'UploadDocumentWidgetImports.dart';

class BuildUploadWorkDocumentText extends StatelessWidget {
  BuildUploadWorkDocumentText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: tr(context, "register"),
          size: 18,
          color: MyColors.primary,
        ),
        MyText(
          title: tr(context, "documentForSignature"),
          size: 18,
          color: MyColors.primary,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: MyText(
            title: text,
            size: 14,
            color: MyColors.black,
            alien: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
