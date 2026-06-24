part of 'CategoriesImports.dart';


class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final CategoriesData categoriesData = CategoriesData();
  @override
  void initState() {
    categoriesData.fetchMainCats(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      children: [
        BuildCatsPics(categoriesData: categoriesData),
        LoadingButton(
          borderRadius: 40,
          btnKey: categoriesData.btnKey,
          title: tr(context, "confirm"),
          onTap: () =>categoriesData.onEditCats(context),
          color: MyColors.primary,
          textColor: MyColors.white,
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
      ],
    );
  }
}
