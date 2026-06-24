part of 'AddProductWImports.dart';

class BuildProductPic extends StatelessWidget {
  final bool editProduct;
  final ProductModel model ;


  const BuildProductPic({
    Key? key,
    required this.addProductData,
    required this.editProduct, required this.model,
  }) : super(key: key);

  final AddProductData addProductData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextField(
          fieldTypes: FieldTypes.clickable,
          fillColor: MyColors.textFields,
          hint: tr(context, "productPic"),
          controller: addProductData.productPic,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          suffixIcon: Icon(Icons.camera_alt),
          validate: (value) => value!.noValidate(),
          onTab: () => addProductData.setTradeImage(),
        ),
        BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
          bloc: addProductData.productImgCubit,
          builder: (_, state) {
            if (state.data != null) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black45, BlendMode.screen),
                          image: FileImage(state.data!),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 5,
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: -5,
                    right: -60,
                    child: GestureDetector(
                      onTap: () => addProductData.setTradeImage(),
                      child: Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(.5),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: MyColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              if (editProduct) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Center(
                      child: CachedImage(
                        url: model.image??'',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      left: -5,
                      right: -60,
                      child: GestureDetector(
                        onTap: () => addProductData.setTradeImage(),
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: MyColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }
          },
        ),
      ],
    );
  }
}
