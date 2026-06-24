part of 'AddProductImports.dart';

class AddProduct extends StatefulWidget {
  final bool editProduct;
  final ProductModel? model;
  const AddProduct({Key? key, required this.editProduct, this.model})
      : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final AddProductData addProductData = AddProductData();
  @override
  void initState() {
    addProductData.controller = ScrollController();
    if (widget.editProduct) {
      addProductData.initEditProduct(widget.model!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: widget.editProduct ? tr(context,"editProduct") : tr(context, "addProduct"),
      back: true,
      body: ListView(
        controller: addProductData.controller,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          BuildAddProductFormInputs(
            addProductData: addProductData,
            model: widget.model ?? ProductModel(),
            editProduct: widget.editProduct,
          ),
          addProductBtn(
            addProductData: addProductData,
            editProduct: widget.editProduct,
            model: widget.model ?? ProductModel(),
          )
        ],
      ),
    );
  }
}
