part of 'AddProductWImports.dart';

class addProductBtn extends StatelessWidget {
  final bool editProduct;
  final ProductModel model;
  const addProductBtn({
    Key? key,
    required this.addProductData,
    required this.editProduct,
    required this.model,
  }) : super(key: key);

  final AddProductData addProductData;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 40,
      btnKey: addProductData.btnKey,
      title: editProduct ? tr(context, "update") : tr(context, "add"),
      onTap: () {
        if (editProduct) {
          addProductData.onEditProduct(context, productModel: model);
        } else {
          addProductData.onAddProduct(context);
        }
      },
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
