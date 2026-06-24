part of 'LocationWidgetsImports.dart';

class BuildMapSearch extends StatelessWidget {
  const BuildMapSearch({
    Key? key,
    required this.locationAddressData,
  }) : super(key: key);

  final LocationAddressData locationAddressData;

  @override
  Widget build(BuildContext context) {
    return TranslateAnimation(
      duration: Duration(milliseconds: 800),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 1, spreadRadius: 1)
          ],
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () =>
              locationAddressData.onSearchPressed(context),
          child: Icon(
            Icons.search,
            size: 25,
          ),
        ),
      ),
    );
  }
}