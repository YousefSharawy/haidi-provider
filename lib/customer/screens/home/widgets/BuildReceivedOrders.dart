part of 'HomeWidgetImports.dart';

class BuildReceivedOrders extends StatelessWidget {
  final HomeModel model;
  const BuildReceivedOrders({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: MyColors.primary.withOpacity(.9),
            ),
            child: InkWell(
              onTap: ()=>Nav.navigateTo(Orders(isMarketOrders: false,), navigatorType: NavigatorType.push),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(color: MyColors.primary),
                      child: Icon(Icons.receipt_long, color: MyColors.white)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(title: model.orderServiceCount.toString(), size: 12, color: Colors.white),
                      MyText(
                          title: tr(context, "serviceReservations"),
                          size: 10,
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: MyColors.primary.withOpacity(.9),
            ),
            child: InkWell(
              onTap: ()=>Nav.navigateTo( Orders(isMarketOrders: true), navigatorType: NavigatorType.push),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(color: MyColors.primary),
                      child: Icon(Icons.receipt_long, color: MyColors.white)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(title: model.orderProductCount.toString(), size: 12, color: Colors.white),
                      MyText(
                          title: tr(context, "storeReservations"),
                          size: 10,
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
