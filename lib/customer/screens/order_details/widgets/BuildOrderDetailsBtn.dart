part of 'OrderDetailsWImports.dart';

class BuildOrderDetailsBtn extends StatelessWidget {
  final int status;
  final int orderId;
  final bool isMarket ;
  final OrderDetailsData orderDetailsData;
  const BuildOrderDetailsBtn({
    Key? key,
    required this.status,
    required this.orderDetailsData,
    required this.orderId, required this.isMarket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("zzzzzzzzzz"'$status');
    if (status == 1) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: DefaultButton(
                borderRadius: BorderRadius.circular(40),
                title: tr(context, "refuse"),
                onTap: ()=>orderDetailsData.refuseProductOrder(context, orderId: orderId, isMarket: isMarket),
                color: MyColors.primary,
                textColor: MyColors.white,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              ),
            ),
            Expanded(
              child: DefaultButton(
                borderRadius: BorderRadius.circular(40),
                title: tr(context, "accept"),
                onTap: () => orderDetailsData.acceptProductOrder(context,
                    orderId: orderId, isMarket: isMarket),
                color: MyColors.primary,
                textColor: MyColors.white,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              ),
            ),
          ],
        ),
      );
    } else if (status == 2) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DefaultButton(
          borderRadius: BorderRadius.circular(40),
          title: tr(context, "finishOrder"),
          onTap: () =>orderDetailsData.finishProductOrder(context, orderId: orderId, isMarket: isMarket),
          color: MyColors.primary,
          textColor: MyColors.white,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
