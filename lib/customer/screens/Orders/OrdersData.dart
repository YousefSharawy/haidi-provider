part of 'OrdersImports.dart';

class OrdersData {

  static final OrdersData _instance = OrdersData._internal();

  factory OrdersData() => _instance;

  OrdersData._internal();

  late GenericBloc<List<OrderModel>> orderCubit ;
  late GenericBloc<int> statusCubit ;
  late  TabController controller;

  fetchOrderMarket(BuildContext context, {required int status}) async {
    orderCubit.onUpdateLoader(true);
    List<OrderModel> result = await CustomerRepository(context)
        .getOrderMarketProvider(status: status);
    orderCubit.onUpdateData(result);
  }

  fetchOrderService(BuildContext context, {required int status}) async {
    orderCubit.onUpdateLoader(true);
    var result = await CustomerRepository(context)
        .getOrderServiceProvider(status: status);
    orderCubit.onUpdateData(result);
  }

  fetchOrders(BuildContext context,
      {required int status, required bool isMarketOrders}) {
    if (isMarketOrders) {
      fetchOrderMarket(context, status: status);
    } else {
      fetchOrderService(context, status: status);
    }
  }

  List<Widget> serviceTab = [
    Tab(text: tr(navigationKey.currentContext!, "newOrders")),
    Tab(text: tr(navigationKey.currentContext!, "currentOrders")),
    Tab(text: tr(navigationKey.currentContext!, "endedOrder")),
    Tab(text: tr(navigationKey.currentContext!, "cancelOrder")),
  ];
  List<Widget> marketTab = [
    Tab(text: tr(navigationKey.currentContext!, "newOrders")),
    Tab(text: tr(navigationKey.currentContext!, "currentOrders")),
    Tab(text: tr(navigationKey.currentContext!, "cancelOrder")),
  ];

  navigateToDetails(BuildContext context, int index,
      {required bool isMarket}) async {
    int? result = await Navigator.push<int>(
        context,
        MaterialPageRoute(
            builder: (context) => OrderDetails(
                  productId: orderCubit.state.data[index].orderId ?? 0,
                  status: statusCubit.state.data,
                  isMarket: isMarket,
                )));
    // log('zzzzzzzzzzzzzzzzzzzz2');
    if (result != null) {
      // log('zzzzzzzzzzzzzzzzzzzz3 $result');
      orderCubit.onUpdateLoader(true);
      orderCubit.state.data.removeWhere((e) => e.orderId == result);
      orderCubit.onUpdateData(orderCubit.state.data);
      // log('zzzzzzzzzzzzzzzzzzzz4 $result');
    }
    // log('zzzzzzzzzzzzzzzzzzzz5$result');
  }

  init(BuildContext context, SingleTickerProviderStateMixin ticker, {int index =0,required bool isMarketOrders}) {
    controller = TabController(length: isMarketOrders ? 3 : 4, vsync: ticker);
    controller.animateTo(index);
    orderCubit = GenericBloc([]);
    statusCubit = GenericBloc(1);
    // statusCubit.onUpdateData(1);
    fetchOrders(context, status: 1, isMarketOrders: isMarketOrders);
  }
}
