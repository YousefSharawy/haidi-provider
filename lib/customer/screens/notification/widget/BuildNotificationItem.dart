part of 'NotificationWImports.dart';

class BuildNotificationItem extends StatelessWidget {
  final NotificationModel model ;
  final NotificationsData notificationsData;
  const BuildNotificationItem({
    Key? key, required this.model, required this.notificationsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Nav.navigateTo(
            OrderDetails(
              productId: model.orderId ?? 0,
              status: model.orderstatus?? 0,
              isMarket: model.ordertype == 1? true : false,
            ),
            navigatorType: NavigatorType.push);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 3),
        color: MyColors.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MyText(
                  title: model.text??'',
                  size: 10,
                  fontWeight: FontWeight.bold,
                  maxLines: 3),
            ),
            InkWell(
                onTap: () =>notificationsData.removeSingleNotification(context, notificationId: model.id??0),
                child: Icon(
                  Icons.close,
                ))
          ],
        ),
      ),
    );
  }
}
