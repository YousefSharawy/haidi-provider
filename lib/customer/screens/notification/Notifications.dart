part of 'NotificationsWImports.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final NotificationsData notificationsData = NotificationsData();

  @override
  void initState() {
    notificationsData.fetchNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigationKey.currentState!.pop(notificationsData.notifiyId);
        return true;
      },
      child: AuthScaffold(
        title: tr(context, "notifications"),
        back: true,
        onLeadingPressed: () =>
            navigationKey.currentState!.pop(notificationsData.notifiyId),
        body: BlocBuilder<GenericBloc<List<NotificationModel>?>,
            GenericState<List<NotificationModel>?>>(
          bloc: notificationsData.notificationCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              if (state.data!.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async =>
                      notificationsData.fetchNotification(context),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: state.data?.length ?? 0,
                    itemBuilder: (context, index) => BuildNotificationItem(
                      model: state.data?[index] ?? NotificationModel(),
                      notificationsData: notificationsData,
                    ),
                  ),
                );
              } else {
                return Center(child: MyText(title: tr(context, "noNotifications"), size: 10));
              }
            } else {
              return Center(
                child: LoadingDialog.showLoadingView(),
              );
            }
          },
        ),
      ),
    );
  }
}
