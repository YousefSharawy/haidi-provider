part of 'LocationWidgetsImports.dart';

class MarkerDetailsButtonSheet extends StatelessWidget {
  final String title;
  final String address;
  const MarkerDetailsButtonSheet({
    Key? key,
    required this.address,
    required this.title,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TranslateAnimation(
      duration: Duration(milliseconds: 800),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            MyText(
                title: address,
                color: MyColors.black,
                size: 12,
                fontWeight: FontWeight.bold),
            MyText(
                title: title,
                //"${latLng.latitude},${latLng.longitude}"
                color: MyColors.grey,
                size: 10,
                fontWeight: FontWeight.bold),
            //
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            //   child: FloatingActionButton(
            //     key: UniqueKey(),
            //     child: InkWell(
            //         child: MyText(
            //       title: 'تحرك',
            //       size: 10,
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     )),
            //     onPressed: () {
            //
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
