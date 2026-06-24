part of 'OrderDetailsWImports.dart';

class BuildServiceDetailsLogic extends StatelessWidget {
  const BuildServiceDetailsLogic({
    Key? key,
    required this.orderDetailsData,
    required this.widget, required this.isMarket,
  }) : super(key: key);

  final OrderDetailsData orderDetailsData;
  final OrderDetails widget;
  final bool isMarket ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<ServiceOrderDetailsModel>>,
        GenericState<List<ServiceOrderDetailsModel>>>(
      bloc: orderDetailsData.serviceOrderDetailsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => BuildServiceOrderDetailsItem(model: state.data[index]),
                  ),
                ),
                BuildOrderDetailsBtn(
                  status: widget.status,
                  orderDetailsData: orderDetailsData,
                  orderId: widget.productId, isMarket: isMarket,
                )
              ],
            );
          } else {
            return Center(
                child: MyText(title: tr(context, "noProductInOrder"), size: 10));
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
