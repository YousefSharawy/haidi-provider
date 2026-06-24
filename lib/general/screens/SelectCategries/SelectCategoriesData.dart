part of 'SelectCategoriesImports.dart';

class SelectCategoriesData {
  final GenericBloc<List<CategoriesModel>> mainCatCubit = GenericBloc([]);
  final GenericBloc<List<CategoriesModel>> selectedCatsCubit = GenericBloc([]);
  final TextEditingController catPicController = new TextEditingController();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  Map<String, dynamic> body = {};

  fetchMainCats(BuildContext context) async {
    List<CategoriesModel> result =
        await GeneralRepository(context).getCategories();
    mainCatCubit.onUpdateData(result);
  }

  setTradeImageImage(int index) async {
    var imageResult = await Utils.getImage();
    if (imageResult != null) {
      selectedCatsCubit.state.data[index].tradePic = imageResult;
      selectedCatsCubit.onUpdateData(selectedCatsCubit.state.data);
    }
  }

  setTaxImageImage(int index) async {
    var imageResult = await Utils.getImage();
    if (imageResult != null) {
      selectedCatsCubit.state.data[index].taxPic = imageResult;
      selectedCatsCubit.onUpdateData(selectedCatsCubit.state.data);
    }
  }

  toggleSelectedCats(bool value, int index) {
    var data = mainCatCubit.state.data;
    data[index].selected = value;
    mainCatCubit.onUpdateData(data);
    _calculateSelected(index);
  }

  _calculateSelected(int index) {
    selectedCatsCubit.onUpdateData([]);
    if (mainCatCubit.state.data.isNotEmpty) {
      mainCatCubit.state.data.forEach((element) {
        if (element.selected) {
          selectedCatsCubit.state.data.add(element);
        }
      });
    }
    selectedCatsCubit.onUpdateData(selectedCatsCubit.state.data);
    // log("sssssss ${selectedCatsCubit.state.data}");
  }

  onSelectSections(BuildContext context, String userId) async {
    body = {};

    for (int i = 0; i < selectedCatsCubit.state.data.length; i++) {
      if (selectedCatsCubit.state.data[i].taxPic == null) {
        LoadingDialog.showSnackBar(context,
            ' ${tr(context,"uShouldEnterTaxFor")}${selectedCatsCubit.state.data[i].name}');
        return;
      }
      if (selectedCatsCubit.state.data[i].tradePic == null) {
        LoadingDialog.showSnackBar(context,
            ' ${tr(context, "uShouldEnterCommercialFor")}${selectedCatsCubit.state.data[i].name}');
        return;
      }
      body.addAll({
        "dto[$i].categoryId": selectedCatsCubit.state.data[i].id,
        "dto[$i].taxRecord": selectedCatsCubit.state.data[i].taxPic,
        "dto[$i].commercialRecord": selectedCatsCubit.state.data[i].tradePic,
      });
    }
    // log(body.toString());
    if (selectedCatsCubit.state.data.isEmpty) {
      LoadingDialog.showSnackBar(context, tr(context, "uShouldSelectSection"));
      return;
    }
    btnKey.currentState!.animateForward();
    bool result = await GeneralRepository(context)
        .addProviderRegistrationCategories(userId, body);
    if (result) {
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
  }
}
