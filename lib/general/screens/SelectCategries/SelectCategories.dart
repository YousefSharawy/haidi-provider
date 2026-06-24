part of 'SelectCategoriesImports.dart';

class SelectCategories extends StatefulWidget {
  final String userId ;
  const SelectCategories({Key? key, required this.userId}) : super(key: key);

  @override
  State<SelectCategories> createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  final SelectCategoriesData selectCategoriesData = SelectCategoriesData();

  @override
  void initState() {
    selectCategoriesData.fetchMainCats(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          BuildCatDetails(),
          BuildCatItems(selectCategoriesData: selectCategoriesData),
          BuildCatPics(selectCategoriesData: selectCategoriesData),
          BuildConfirmButton(selectCategoriesData: selectCategoriesData, userId: widget.userId),
        ],
      ),
    );
  }
}


