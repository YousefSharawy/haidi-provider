part of 'OffersWImports.dart';

class BuildOfferButton extends StatelessWidget {
  final OffersData offerData;

  const BuildOfferButton({Key? key, required this.offerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: offerData.loadingOffer,
          builder: (context, state) {
            if (state.data) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(children: [
                  MyText(title: tr(context, "loadingPic"), size: 10),
                  const SizedBox(width: 5),
                  CupertinoActivityIndicator(
                    color: MyColors.primary,
                  ),
                ]),
              );
            } else
              return SizedBox();
          },
        ),
        InkWell(
          onTap: () => offerData.setLogoImage(context),
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
              title: tr(context, "addNewOffer"),
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
