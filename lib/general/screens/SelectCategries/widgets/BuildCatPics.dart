part of 'SelectCatWImports.dart';

class BuildCatPics extends StatelessWidget {
  final SelectCategoriesData selectCategoriesData;
  const BuildCatPics({Key? key, required this.selectCategoriesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<CategoriesModel>>,
        GenericState<List<CategoriesModel>>>(
      bloc: selectCategoriesData.selectedCatsCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                selectCategoriesData.selectedCatsCubit.state.data.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(title: state.data[index].name??'', size: 13,fontWeight: FontWeight.bold),
                        GenericTextField(
                          hintColor: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.color
                              ?.withOpacity(.8),
                          fieldTypes: FieldTypes.clickable,
                          fillColor: MyColors.textFields,
                          hint: tr(context, "commercialPic"),
                          controller: selectCategoriesData.catPicController,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.next,
                          type: TextInputType.text,
                          suffixIcon: Icon(Icons.camera_alt),
                          validate: (value) => value!.noValidate(),
                          onTab: () => selectCategoriesData.setTradeImageImage(index),
                        ),
                        BlocBuilder<GenericBloc<List<CategoriesModel>>, GenericState<List<CategoriesModel>>>(
                          bloc: selectCategoriesData.selectedCatsCubit,
                          builder: (_, state) {
                            if (state.data[index].tradePic != null) {
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black45, BlendMode.screen),
                                          image: FileImage(state.data[index].tradePic??File('')),
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
                                      onTap: () =>
                                          selectCategoriesData.setTradeImageImage(index),
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
                          },
                        ),
                        GenericTextField(
                          hintColor: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.color
                              ?.withOpacity(.8),
                          fieldTypes: FieldTypes.clickable,
                          fillColor: MyColors.textFields,
                          hint: tr(context, "taxPic"),
                          controller: selectCategoriesData.catPicController,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.next,
                          type: TextInputType.text,
                          suffixIcon: Icon(Icons.camera_alt),
                          validate: (value) => value!.noValidate(),
                          onTab: () => selectCategoriesData.setTaxImageImage(index),
                        ),
                        BlocBuilder<GenericBloc<List<CategoriesModel>>, GenericState<List<CategoriesModel>>>(
                          bloc: selectCategoriesData.selectedCatsCubit,
                          builder: (_, state) {
                            if (state.data[index].taxPic != null) {
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black45, BlendMode.screen),
                                          image: FileImage(state.data[index].taxPic??File('')),
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
                                      onTap: () =>
                                          selectCategoriesData.setTaxImageImage(index),
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
                          },
                        ),
                      ],
                    ))
          ],
        );
      },
    );
  }
}
