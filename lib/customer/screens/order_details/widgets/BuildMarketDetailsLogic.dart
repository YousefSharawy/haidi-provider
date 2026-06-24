part of 'OrderDetailsWImports.dart';

class BuildMarketDetailsLogic extends StatelessWidget {
  final bool isMarket;

  const BuildMarketDetailsLogic({
    Key? key,
    required this.orderDetailsData,
    required this.widget,
    required this.isMarket,
  }) : super(key: key);

  final OrderDetailsData orderDetailsData;
  final OrderDetails widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<marketOrderDetailsModel?>,
        GenericState<marketOrderDetailsModel?>>(
      bloc: orderDetailsData.marketOrderDetailsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data!.orderProducts!.isNotEmpty) {
            return Column(
              children: [
                // BuildOrderDetailsHeader(model: state.data!),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.data?.orderProducts?.length ?? 0,
                    itemBuilder: (context, index) =>
                        BuildMarketOrderDetailsItem(
                      orderDetailsData: orderDetailsData,
                      model: state.data!.orderProducts![index],
                      marketDetailsModel: state.data!,
                    ),
                  ),
                ),
                BuildOrderDetailsBtn(
                  status: widget.status,
                  orderDetailsData: orderDetailsData,
                  orderId: widget.productId,
                  isMarket: isMarket,
                )
              ],
            );
          } else {
            return Center(
                child:
                    MyText(title: tr(context, "noProductInOrder"), size: 10));
          }
        } else {
          return Center(
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
