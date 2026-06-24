part of 'CategoriesWImports.dart';

class BuildCatsPics extends StatelessWidget {
  final CategoriesData categoriesData;
  const BuildCatsPics({Key? key, required this.categoriesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserCubit>().state.model;
    return BlocBuilder<GenericBloc<List<CategoriesModel>>,
        GenericState<List<CategoriesModel>>>(
      bloc: categoriesData.selectedCatsCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                categoriesData.selectedCatsCubit.state.data.length,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                            title: state.data[index].name ?? '',
                            size: 13,
                            fontWeight: FontWeight.bold),
                        GenericTextField(
                          hintColor: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.color
                              ?.withOpacity(.8),
                          fieldTypes: FieldTypes.clickable,
                          fillColor: MyColors.textFields,
                          hint: tr(context, "commercialPic"),
                          controller: categoriesData.catPicController,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.next,
                          type: TextInputType.text,
                          suffixIcon: Icon(Icons.camera_alt),
                          validate: (value) => value!.noValidate(),
                          onTab: () => categoriesData.setTradeImageImage(index),
                        ),
                        BlocBuilder<GenericBloc<List<CategoriesModel>>,
                            GenericState<List<CategoriesModel>>>(
                          bloc: categoriesData.selectedCatsCubit,
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
                                          image: FileImage(
                                              state.data[index].tradePic!),
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
                                      onTap: () => categoriesData
                                          .setTradeImageImage(index),
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
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: CachedImage(
                                          url: state.data[index].commercialRecord??'',
                                          width: 120,
                                          height: 120,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 2,
                                    left: -5,
                                    right: -60,
                                    child: GestureDetector(
                                      onTap: () => categoriesData
                                          .setTradeImageImage(index),
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
                          controller: categoriesData.catPicController,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.next,
                          type: TextInputType.text,
                          suffixIcon: Icon(Icons.camera_alt),
                          validate: (value) => value!.noValidate(),
                          onTab: () => categoriesData.setTaxImageImage(index),
                        ),
                        BlocBuilder<GenericBloc<List<CategoriesModel>>,
                            GenericState<List<CategoriesModel>>>(
                          bloc: categoriesData.selectedCatsCubit,
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
                                          image: FileImage(
                                              state.data[index].taxPic!),
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
                                      onTap: () => categoriesData
                                          .setTaxImageImage(index),
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
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: CachedImage(
                                          url: state.data[index].taxRecord??'',
                                          width: 120,
                                          height: 120,
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 2,
                                    left: -5,
                                    right: -60,
                                    child: GestureDetector(
                                      onTap: () => categoriesData
                                          .setTaxImageImage(index),
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
