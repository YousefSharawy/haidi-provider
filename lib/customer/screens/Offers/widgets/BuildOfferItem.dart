part of 'OffersWImports.dart';

class BuildOfferItem extends StatelessWidget {
  final OfferModel model;
  final OffersData offersData;
  const BuildOfferItem({
    Key? key,
    required this.model,
    required this.offersData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CachedImage(
            url: model.offerImage ?? '',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(15),
          ),
          InkWell(
            onTap: () =>
                offersData.deleteOffer(context, offerId: model.id ?? 0),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.cancel_sharp, color: MyColors.primary),
            ),
          )
        ],
      ),
    );
  }
}
