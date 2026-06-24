part of 'LocationWidgetsImports.dart';


class BuildSaveButton extends StatelessWidget {
  final LocationAddressData locationAddressData;

  const BuildSaveButton({required this.locationAddressData});

  @override
  Widget build(BuildContext context) {
    return TranslateAnimation(
      duration: Duration(milliseconds: 1200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ()=>locationAddressData.getMyLocationByButtonPressed(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              // width: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Row(
                children: [
                  MyText(
                    title: tr(context, "myLoc"),
                    size: 10,
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(Icons.gps_fixed_outlined,size: 15,color: Colors.white,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: ()=>locationAddressData.saveChangedLocation(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              // width: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Row(
                children: [
                  MyText(
                    title: tr(context,'saveLocation'),
                    size: 12,
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
