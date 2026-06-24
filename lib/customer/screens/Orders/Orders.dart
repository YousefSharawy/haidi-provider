part of 'OrdersImports.dart';

class Orders extends StatefulWidget {
  final bool isMarketOrders;
  final int index;

  const Orders({Key? key, required this.isMarketOrders, this.index = 0})
      : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    OrdersData().init(context, this,
        isMarketOrders: widget.isMarketOrders, index: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "orders"),
      back: true,
      body: Column(
        children: [
          BuildOrderTabBar(
              ordersData: OrdersData(), isMarketOrders: widget.isMarketOrders),
          BlocBuilder<GenericBloc<List<OrderModel>>,
              GenericState<List<OrderModel>>>(
            bloc: OrdersData().orderCubit,
            builder: (context, state) {
              if (!state.loading) {
                if (state.data.isNotEmpty) {
                  return Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            print(">>>>>$index ${state.data[index].paymentType.toString()}");
                            return BuildOrdersCartItem(
                              onTap: () => OrdersData().navigateToDetails(
                                context,
                                index,
                                isMarket: widget.isMarketOrders,
                              ),
                              price: state.data[index].price?.toDouble() ?? 0.0,
                              clientName: state.data[index].clientName,
                              orderNum: state.data[index].orderId.toString(),
                              paymentType:
                                  state.data[index].paymentType,
                              serviceNum:
                                  state.data[index].servicesCount.toString(),
                            );
                          }));
                } else {
                  return Expanded(
                    child: Center(
                      child: MyText(
                          title: tr(context, "noOrders"),
                          size: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  );
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
        ],
      ),
    );
  }
}
