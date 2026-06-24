part of 'OrderDetailsImports.dart';

class OrderDetails extends StatefulWidget {
  final int productId;
  final int status;
  final bool isMarket;

  const OrderDetails(
      {Key? key,
      required this.productId,
      required this.status,
      required this.isMarket})
      : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderDetailsData orderDetailsData = OrderDetailsData();
  @override
  void initState() {
    orderDetailsData.fetchOrderDetails(context,
        orderId: widget.productId, isMarket: widget.isMarket);
    super.initState();
  }

  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "orderDetails"),
      back: true,
      body: widget.isMarket
          ? BuildMarketDetailsLogic(orderDetailsData: orderDetailsData, widget: widget, isMarket: widget.isMarket)
          : BuildServiceDetailsLogic(orderDetailsData: orderDetailsData, widget: widget, isMarket: widget.isMarket),
    );
  }
}
