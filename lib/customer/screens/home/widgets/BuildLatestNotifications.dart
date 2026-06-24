part of 'HomeWidgetImports.dart';

class BuildLatestNotifications extends StatelessWidget {
  final HomeModel homeModel;
  final HomeData homeData;

  const BuildLatestNotifications(
      {Key? key, required this.homeModel, required this.homeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MyText(
            title: tr(context, "latestNotifications"),
            size: 12,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (homeModel.notificationsModel!.isNotEmpty)
          ...List.generate(
              homeModel.notificationsModel?.length ?? 0,
              (index) => InkWell(
                    onTap: () {
                      Nav.navigateTo(
                          OrderDetails(
                            productId: homeModel.notificationsModel![index].orderId ?? 0,
                            status: homeModel.notificationsModel![index].orderstatus?? 0,
                            isMarket: homeModel.notificationsModel![index].ordertype == 1? true : false,
                          ),
                          navigatorType: NavigatorType.push);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: MyColors.secondary,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyText(
                              title:
                                  homeModel.notificationsModel?[index].text ??
                                      '',
                              size: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => homeData.removeSingleNotification(
                                context,
                                notificationId:
                                    homeModel.notificationsModel?[index].id ??
                                        0),
                            child: Icon(
                              Icons.close,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        if (homeModel.notificationsModel!.isEmpty)
          Center(
              child: MyText(title: tr(context, "noNotifications"), size: 10)),
      ],
    );
  }
}
