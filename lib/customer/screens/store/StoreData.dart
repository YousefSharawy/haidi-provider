part of 'StoreImports.dart';

class StoreData {
  final GenericBloc<List<ProductModel>> productCubit = GenericBloc([]);
  final GlobalKey<CustomButtonState> btnYesKey = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnNoKey = GlobalKey<CustomButtonState>();

  fetchStoreProduct(BuildContext context) async {
    productCubit.onUpdateLoader(true);
    List<ProductModel> result =
        await CustomerRepository(context).getStoreProduct();
    productCubit.onUpdateData(result);
  }

  deleteProduct(BuildContext context, {required int productId}) async {
    var result =
        await CustomerRepository(context).deleteProduct(productId: productId);
    if (result) {
      Navigator.of(context).pop();
      productCubit.state.data.removeWhere((element) => element.id == productId);
      productCubit.onUpdateData(productCubit.state.data);
    }
  }

  navigateToEditProduct(BuildContext context,
      {required ProductModel model}) async {
    log('========================= first');
    List<ProductModel>? result = await Navigator.push<List<ProductModel>>(
        context,
        MaterialPageRoute(
            builder: (context) => AddProduct(
                  editProduct: true,
                  model: model,
                )));
    log('========================= second ${result} ');
    if (result != null) {
      log('========================= check ${result}');
      productCubit.onUpdateData(result);
      log('========================= updated result${result}');
      log('========================= updated productCubit${productCubit.state.data}');
    }
  }
}
