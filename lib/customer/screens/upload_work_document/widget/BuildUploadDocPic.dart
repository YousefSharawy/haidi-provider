part of 'UploadDocumentWidgetImports.dart';

class BuildUploadDocPic extends StatelessWidget {
  BuildUploadDocPic({
    Key? key,
    required this.uploadWorkDocumentData, required this.userId,
  }) : super(key: key);

  final String userId;
  final UploadWorkDocumentData uploadWorkDocumentData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GenericTextField(
        hintColor:
            Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
        fieldTypes: FieldTypes.clickable,
        fillColor: MyColors.textFields,
        hint: tr(context, "uploadTheDocument"),
        controller: uploadWorkDocumentData.doc,
        margin: const EdgeInsets.symmetric(vertical: 10),
        action: TextInputAction.next,
        type: TextInputType.text,
        suffixIcon: Icon(Icons.camera_alt),
        validate: (value) => value!.noValidate(),
        onTab: () => uploadWorkDocumentData.UploadDoc(context , userId),
      ),
    );
  }
}
