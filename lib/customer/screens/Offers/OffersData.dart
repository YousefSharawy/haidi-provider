part of 'OffersImports.dart';

class OffersData {
  final GenericBloc<List<OfferModel>?> offerCubit = GenericBloc([]);
  final GenericBloc<File?> offerImageCubit = GenericBloc(null);
  final GenericBloc<bool> loadingOffer = GenericBloc(false);
  late final ScrollController _controller;
  ScrollController get controller => _controller;

  fetchOffers(BuildContext context) async {
    List<OfferModel> result = await CustomerRepository(context).getListOffer();
    offerCubit.onUpdateData(result);
  }

  deleteOffer(BuildContext context, {required int offerId}) async {
    List<OfferModel> result =
        await CustomerRepository(context).deleteOffer(offerId);
    offerCubit.onUpdateData(result);
    CustomToast.showSimpleToast(msg: tr(context, "deletedSuccessfully"));
  }

  setLogoImage(BuildContext context) async {
    var image = await Utils.getImage();
    if (image != null) {
      offerImageCubit.onUpdateData(image);
      addOffer(context);
    }
  }

  addOffer(BuildContext context) async {
    loadingOffer.onUpdateData(true);
    List<OfferModel>? result = await CustomerRepository(context).addNewOffer(
      offerImage: offerImageCubit.state.data,
    );
    if (result != null) {
      loadingOffer.onUpdateData(false);
      offerCubit.onUpdateData(result);
      _controller.animateTo(
        controller.position.maxScrollExtent + 200,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      CustomToast.showSimpleToast(msg: tr(context, "newOfferAdded"));
    }
  }

  init(BuildContext context) {
    _controller = ScrollController();
    fetchOffers(context);
  }

  dispose() {
    _controller.dispose();
  }
}
