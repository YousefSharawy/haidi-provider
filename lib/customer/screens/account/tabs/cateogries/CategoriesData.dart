part of 'CategoriesImports.dart';

class CategoriesData {
  // final GenericBloc<List<CategoriesModel>> mainCatCubit = GenericBloc([]);
  final GenericBloc<List<CategoriesModel>> selectedCatsCubit = GenericBloc([]);
  final TextEditingController catPicController = new TextEditingController();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  Map<String, dynamic> body = {};

  fetchMainCats(BuildContext context) async {
    UserModel user = context.read<UserCubit>().state.model;
    List<CategoriesModel> result = [];
    user.mainCategories!.forEach((element) {
      result.add(
        CategoriesModel(
          selected: true,
          id: element.id,
          name: element.title,
          taxRecord: element.taxRecord,
          commercialRecord: element.commercialNumber,
        ),
      );
    });
    selectedCatsCubit.onUpdateData(result);
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

  onEditCats(BuildContext context) async {
    var user = context.read<UserCubit>();
    body = {};
    for (int i = 0; i < selectedCatsCubit.state.data.length; i++) {
      body.addAll({
        "dto[$i].id": selectedCatsCubit.state.data[i].id,
        "dto[$i].taxImage": selectedCatsCubit.state.data[i].taxPic,
        "dto[$i].commercialImage": selectedCatsCubit.state.data[i].tradePic,
      });
    }
    log(body.toString());
    if (selectedCatsCubit.state.data.isEmpty) {
      LoadingDialog.showSnackBar(context, tr(context, "uShouldSelectSection"));
      return;
    }
    if (body.isEmpty) {
      LoadingDialog.showSnackBar(context, tr(context, "uShouldSelectPic"));
      return;
    }
    btnKey.currentState!.animateForward();
    List<EditCatModel> result =
        await CustomerRepository(context).updateProviderCategories(body);
    if (result.isNotEmpty) {
      result.forEach((element) {
       user.state.model.mainCategories?.forEach((e) {
         if(element.id==e.id){
           e.taxRecord = element.taxRecord;
           e.commercialNumber = element.commercialRecord;
         }
       });
       user.onUpdateUserData(user.state.model);
      });
      LoadingDialog.showSnackBar(context, tr(context, "updatedSuccessfully"));
      btnKey.currentState!.animateReverse();
      navigationKey.currentState!.pop();
    }
    btnKey.currentState!.animateReverse();
  }
}
