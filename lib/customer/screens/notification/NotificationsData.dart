part of'NotificationsWImports.dart';

class NotificationsData{

  final GenericBloc<List<NotificationModel>?> notificationCubit = GenericBloc([]);
   int ? notifiyId ;

  fetchNotification(BuildContext context) async {
    List<NotificationModel> result = await CustomerRepository(context).getNotifications();
    notificationCubit.onUpdateData(result);
  }
  removeSingleNotification(BuildContext context,{required int notificationId}) async {
    notifiyId = notificationId;
    bool result = await CustomerRepository(context).removeSingleNotification(notificationId: notificationId);
    if(result){
      notificationCubit.state.data!.removeWhere((e) => e.id == notificationId);
      notificationCubit.onUpdateData(notificationCubit.state.data);
      log('============4 result $notificationId');
    }
  }
}