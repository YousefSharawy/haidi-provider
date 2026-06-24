part of 'HomeImports.dart';

class HomeData {

  static final HomeData _instance = HomeData._internal();

  HomeData._internal();

  factory HomeData({bool newInstance = false}) {
    if (newInstance) {
      return HomeData();
    } else {
      return _instance;
    }
  }

  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GenericBloc<HomeModel?> homeCubit = GenericBloc(null);

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

  fetchHome(BuildContext context, {bool refresh = true}) async {
    HomeModel? result = await CustomerRepository(context).getHome(refresh);
    homeCubit.onUpdateData(result);
  }

  navigateToNotifications(BuildContext context) async {
    log('============1 result ');
    int? notificationId = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => Notifications(),
      ),
    );
    log('============2 result $notificationId');

    if(notificationId !=null){
      log('============3 result $notificationId');
      homeCubit.state.data!.notificationsModel!.removeWhere((e) => e.id == notificationId);
      homeCubit.onUpdateData(homeCubit.state.data);
      log('============4 result $notificationId');
      log('============4 result ${homeCubit.state.data}');
    }
  }

  removeSingleNotification(BuildContext context,{required int notificationId}) async {

    bool result = await CustomerRepository(context).removeSingleNotification(notificationId: notificationId);
    if(result){
      homeCubit..state.data!.notificationsModel!.removeWhere((e) => e.id == notificationId);
      homeCubit..onUpdateData(homeCubit.state.data);
    }
  }
}
