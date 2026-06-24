part of 'ActiveAccountWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            navigationKey.currentState!.pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
            child: Icon(Icons.arrow_back_ios,),
          ),
        ),
        Hero(
            tag: 'logo',
            child: Padding(
                padding: const EdgeInsets.only(right: 40,left: 40,top: 160),
                child: Image.asset(Res.imagesLogo))),
        Center(
          child: MyText(
            title: tr(context, "activeAccount"),
            size: 16,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
