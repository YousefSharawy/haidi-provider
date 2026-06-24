
part of 'OrderWidgetImports.dart';

class BuildOrderTabBar extends StatelessWidget {
  final OrdersData ordersData;
  final bool isMarketOrders;
  const BuildOrderTabBar({
    Key? key, required this.ordersData, required this.isMarketOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(

      controller: ordersData.controller,
        indicatorWeight: 3,
        unselectedLabelStyle: WidgetUtils.textStyle.copyWith(fontSize: 12,fontWeight: FontWeight.bold),
        labelStyle: WidgetUtils.textStyle.copyWith(fontSize: 12,fontWeight: FontWeight.bold),
        unselectedLabelColor: MyColors.grey,
        labelColor: MyColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: MyColors.primary,
        onTap: (index){
          int states = index +1 ;
          ordersData.statusCubit.onUpdateData(states);
          ordersData.fetchOrders(context, status: states, isMarketOrders: isMarketOrders);
        },
        tabs:isMarketOrders? ordersData.marketTab:ordersData.serviceTab,
    );
  }
}
