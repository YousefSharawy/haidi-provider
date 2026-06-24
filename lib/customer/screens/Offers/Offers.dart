part of 'OffersImports.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final OffersData offersData = OffersData();

  @override
  void initState() {
    offersData.init(context);
    super.initState();
  }
  @override
  void dispose() {
    offersData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "offers"),
      back: true,
      body: Column(
        children: [
          BlocBuilder<GenericBloc<List<OfferModel>?>,
              GenericState<List<OfferModel>?>>(
            bloc: offersData.offerCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                if (state.data!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller:offersData.controller ,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        itemCount: state.data?.length ?? 0,
                        itemBuilder: (context, index) => BuildOfferItem(
                              model: state.data![index],
                              offersData: offersData,
                            )),
                  );
                } else {
                  return Expanded(
                      child: Center(
                          child: MyText(
                    title: tr(context, "noOffers"),
                    size: 10,
                  )));
                }
              } else {
                return Expanded(
                  child: Center(
                    child: LoadingDialog.showLoadingView(),
                  ),
                );
              }
            },
          ),
          BuildOfferButton(offerData: offersData),
        ],
      ),
    );
  }
}
