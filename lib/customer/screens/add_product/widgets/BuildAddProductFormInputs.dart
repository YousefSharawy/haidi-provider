part of 'AddProductWImports.dart';

class BuildAddProductFormInputs extends StatelessWidget {
  final ProductModel model;
  final bool editProduct;

  const BuildAddProductFormInputs({
    Key? key,
    required this.addProductData,
    required this.model,
    required this.editProduct,
  }) : super(key: key);

  final AddProductData addProductData;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addProductData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: tr(context, "selectSection"), size: 10, fontWeight: FontWeight.bold),
          DropdownTextField<DropDownModel?>(
            itemAsString: (dynamic u) => u.name,
            dropKey: addProductData.MainCatKey,
            hint: tr(context, "selectSection"),
            validate: (DropDownModel? value) => value.validateDropDown(context),
            fontSize: 10,
            textSize: 12,
            fillColor: MyColors.secondary,
            radius: BorderRadius.circular(50),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            onChange: addProductData.selectMainCat,
            useName: true,
            selectedItem: addProductData.dropDownModel,
            finData: (v) async =>
                await CustomerRepository(context).getListMarketSubCategories(),
          ),
          MyText(title: tr(context, "productPic"), size: 10, fontWeight: FontWeight.bold),
          BuildProductPic(
            addProductData: addProductData,
            editProduct: editProduct,
            model: model,
          ),
          MyText(
              title: tr(context, "productNameAr"),
              size: 10,
              fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: tr(context, "productNameAr"),
            controller: addProductData.productNameAr,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
              title: tr(context, "productNameEn"),
              size: 10,
              fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: tr(context, "productNameEn"),
            controller: addProductData.productNameEn,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(title: tr(context,"productPrice"), size: 10, fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: tr(context,"productPrice"),
            controller: addProductData.productPrice,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(title: tr(context, "deliveryPrice"), size: 10, fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: tr(context, "deliveryPrice"),
            controller: addProductData.deliveryPrice,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(title: tr(context,"piecesNum"), size: 10, fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: tr(context,"piecesNum"),
            controller: addProductData.piecesNum,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
              title: tr(context,"descriptionAr"),
              size: 10,
              fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.rich,
            radius: BorderRadius.circular(15),
            max: 3,
            fillColor: MyColors.textFields,
            hint: tr(context,"descriptionAr"),
            controller: addProductData.descriptionAr,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
              title: tr(context,"descriptionEn"),
              size: 10,
              fontWeight: FontWeight.bold),
          GenericTextField(
            fieldTypes: FieldTypes.rich,
            radius: BorderRadius.circular(15),
            max: 3,
            fillColor: MyColors.textFields,
            hint: tr(context,"descriptionEn"),
            controller: addProductData.descriptionEn,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildBasicFeatureInput(addProductData: addProductData),
        ],
      ),
    );
  }
}
