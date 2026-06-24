part of 'AddProductImports.dart';

class AddProductData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<DropdownSearchState> MainCatKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController productPic = TextEditingController();
  final TextEditingController productNameAr = TextEditingController();
  final TextEditingController productNameEn = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController deliveryPrice = TextEditingController();
  final TextEditingController piecesNum = TextEditingController();
  final TextEditingController descriptionAr = TextEditingController();
  final TextEditingController descriptionEn = TextEditingController();
  final GenericBloc<File?> productImgCubit = GenericBloc(null);
  final GenericBloc<List<PrimaryFeatures>> primaryFeaturesCubit =
      GenericBloc([]);
  DropDownModel? dropDownModel;
  late final ScrollController controller;
  List<Map<String, dynamic>> featureBody = [];
  List<int> deletedFeatures = [];

  void selectMainCat(DropDownModel? model) {
    dropDownModel = model != null ? model : null;
  }

  setTradeImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      productImgCubit.onUpdateData(image);
    }
  }

  initEditProduct(ProductModel model) {
    deletedFeatures = [];
    dropDownModel = DropDownModel(
        id: model.categoryId,
        name: DioUtils.lang == "ar"
            ? model.categoryNameAr
            : model.categoryNameEn);
    productNameAr.text = model.nameAr ?? '';
    productNameEn.text = model.nameEn ?? '';
    productPrice.text = model.price.toString();
    deliveryPrice.text = model.delivery.toString();
    descriptionAr.text = model.descriptionAr ?? '';
    descriptionEn.text = model.descriptionEn ?? '';
    piecesNum.text = model.count.toString();
    model.features!.forEach((e) {
      primaryFeaturesCubit.state.data.add(PrimaryFeatures(
        id: e.id,
        arabicFeature: TextEditingController(text: e.featureAr),
        englishFeature: TextEditingController(text: e.featureEn),
      ));
    });
    primaryFeaturesCubit.onUpdateData(primaryFeaturesCubit.state.data);
  }

  onAddBasicFeature() {
    primaryFeaturesCubit.state.data.add(PrimaryFeatures(
      arabicFeature: TextEditingController(),
      englishFeature: TextEditingController(),
    ));
    primaryFeaturesCubit.onUpdateData(primaryFeaturesCubit.state.data);
    controller.animateTo(controller.position.maxScrollExtent + 200,
        duration: Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  onRemoveBasicFeature({required int index, required int id}) {
    if (id != 0) {
      deletedFeatures.add(id);
    }
    primaryFeaturesCubit.state.data.removeAt(index);
    primaryFeaturesCubit.onUpdateData(primaryFeaturesCubit.state.data);
    log('list is : ${deletedFeatures.toSet().toList()}');
  }

  _checkProductValidation(BuildContext context, {bool addProduct = true}) {
    if (addProduct) {
      if (dropDownModel?.id == null) {
        controller.animateTo(controller.position.minScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.fastLinearToSlowEaseIn);
        LoadingDialog.showSnackBar(context, tr(context, "uShouldSelectCat"));
        return;
      }
      if (productImgCubit.state.data == null) {
        LoadingDialog.showSnackBar(
            context, tr(context, "uShouldSelectProductPic"));
        controller.animateTo(controller.position.minScrollExtent + 100,
            duration: Duration(milliseconds: 100),
            curve: Curves.fastLinearToSlowEaseIn);
        return;
      }
    } else {
      if (dropDownModel?.id == null) {
        controller.animateTo(controller.position.minScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.fastLinearToSlowEaseIn);
        LoadingDialog.showSnackBar(context, tr(context, "uShouldSelectCat"));
        return;
      }
    }
  }

  _fillProductBody(BuildContext context, {bool addProduct = true}) {
    Map<String, dynamic> mapBody = {};
    featureBody = [];
    for (int i = 0; i < primaryFeaturesCubit.state.data.length; i++) {
      PrimaryFeatures featureCubit = primaryFeaturesCubit.state.data[i];
      if (featureCubit.englishFeature?.text == null ||
          featureCubit.englishFeature?.text == "" ||
          featureCubit.arabicFeature?.text == null ||
          featureCubit.arabicFeature?.text == "") {
        LoadingDialog.showSnackBar(
            context, '${tr(context, "uShouldSelectFeatureNum")}${i + 1}');
        return;
      }
      mapBody.addAll({
        "\"id\"": primaryFeaturesCubit.state.data[i].id ?? 0,
        "\"featureAr\"":
            "\"${primaryFeaturesCubit.state.data[i].arabicFeature?.text ?? ''}\"",
        "\"featureEn\"":
            "\"${primaryFeaturesCubit.state.data[i].englishFeature?.text ?? ''}\"",
      });
      if (!addProduct) {
        featureBody.addAll([mapBody]);
      } else {
        mapBody.remove("\"id\"");
        featureBody.addAll([mapBody]);
      }
    }
  }

  onAddProduct(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    _checkProductValidation(context);
    _fillProductBody(context);
    if (formKey.currentState!.validate()) {
      if(primaryFeaturesCubit.state.data.length != 0){
        btnKey.currentState!.animateForward();
        AddProductDots model = AddProductDots(
          lang: DioUtils.lang,
          titleEn: productNameEn.text,
          titleAr: productNameAr.text,
          price: double.parse(productPrice.text),
          count: int.parse(piecesNum.text),
          delivery: double.parse(deliveryPrice.text),
          descriptionAr: descriptionAr.text,
          descriptionEn: descriptionEn.text,
          image: productImgCubit.state.data,
          subCategoryId: dropDownModel?.id ?? 0,
          features: featureBody.toString(),
        );
        var result = await CustomerRepository(context).addProduct(model: model);
        if (result) {
          btnKey.currentState!.animateReverse();
          navigationKey.currentState!.pop();
          LoadingDialog.showSnackBar(
              context, tr(context, "productAddedCheckDash"));
        }
        btnKey.currentState!.animateReverse();
      }else{
        CustomToast.showSimpleToast(msg: tr(context, "addBasicFeatures"));
      }
    }
    btnKey.currentState!.animateReverse();
  }

  onEditProduct(BuildContext context,
      {required ProductModel productModel}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    _checkProductValidation(context, addProduct: false);
    _fillProductBody(context, addProduct: false);
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      AddProductDots model = AddProductDots(
        id: productModel.id,
        lang: DioUtils.lang,
        titleEn: productNameEn.text,
        titleAr: productNameAr.text,
        price: double.parse(productPrice.text),
        count: int.parse(piecesNum.text),
        delivery: double.parse(deliveryPrice.text),
        descriptionAr: descriptionAr.text,
        descriptionEn: descriptionEn.text,
        image: productImgCubit.state.data,
        subCategoryId: dropDownModel?.id ?? 0,
        features: featureBody.toString(),
        deletedFeatures: deletedFeatures.toSet().toList(),
      );
      List<ProductModel>? result =
          await CustomerRepository(context).editProduct(model: model);
      btnKey.currentState!.animateReverse();
      navigationKey.currentState!.pop(result);

      /// ====>>>>  result
      LoadingDialog.showSnackBar(context, tr(context, "editedSuccessfully"));
    }
    btnKey.currentState!.animateReverse();
  }
}
