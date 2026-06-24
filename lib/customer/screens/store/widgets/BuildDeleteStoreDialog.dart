part of 'StoreWImports.dart';

class BuildDeleteStoreDialog extends StatefulWidget {
  final StoreData storeData;
  final ProductModel model;

  const BuildDeleteStoreDialog(
      {super.key, required this.storeData, required this.model});

  @override
  State<BuildDeleteStoreDialog> createState() => _BuildDeleteStoreDialogState();
}

class _BuildDeleteStoreDialogState extends State<BuildDeleteStoreDialog>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(0),
        actionsPadding: EdgeInsets.all(0),
        buttonPadding: EdgeInsets.all(0),
        title: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: Center(
            child: MyText(
              title: tr(context, "deleteStore"),
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          ),
        ),
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 9,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: LoadingButton(
                  borderRadius: 40,
                  btnKey: widget.storeData.btnYesKey,
                  title: tr(context, "yes"),
                  onTap: () {
                    widget.storeData.deleteProduct(context,
                        productId: widget.model.id ?? 0);
                  },
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              Expanded(
                flex: 1,
                child: LoadingButton(
                  borderRadius: 40,
                  btnKey: widget.storeData.btnNoKey,
                  title: tr(context, "no"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: MyColors.white,
                  textColor: MyColors.primary,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
