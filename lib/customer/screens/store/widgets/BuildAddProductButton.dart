part of 'StoreWImports.dart';

class BuildAddProductButton extends StatelessWidget {
  final bool editProduct ;
  const BuildAddProductButton({
    Key? key, required this.editProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo( AddProduct(editProduct: false),
          navigatorType: NavigatorType.push),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: MyText(
          alien: TextAlign.center,
          title: tr(context, "addProduct"),
          size: 10,
          fontWeight: FontWeight.bold,
          color: MyColors.white,
        ),
      ),
    );
  }
}
