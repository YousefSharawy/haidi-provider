part of 'SelectCatWImports.dart';

class BuildConfirmButton extends StatelessWidget {
  final SelectCategoriesData selectCategoriesData;
  final String userId;
  const BuildConfirmButton({Key? key, required this.selectCategoriesData, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          borderRadius: 40,
          btnKey: selectCategoriesData.btnKey,
          title: tr(context, "confirm"),
          onTap: () =>selectCategoriesData.onSelectSections(context,userId),
          color: MyColors.primary,
          textColor: MyColors.white,
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
        const SizedBox(height: 20),
        // InkWell(
        //   onTap: ()=>GeneralRepository(context).logOut(),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Icon(Icons.login_rounded,color: MyColors.primary),
        //       const SizedBox(width: 10),
        //       MyText(title: 'خروج', size: 12,fontWeight: FontWeight.bold,color: MyColors.primary),
        //     ],
        //   ),
        // )
      ],
    );
}
  }