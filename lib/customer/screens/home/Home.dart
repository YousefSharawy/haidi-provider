part of 'HomeImports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();
  @override
  void initState() {
    setupNotifications(context);
    homeData.fetchHome(context, refresh: false);
    homeData.fetchHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserCubit>().state.model;
    log("token :: ========= >> ${user.token}");
    return WillPopScope(
      onWillPop: homeData.onBackPressed,
      child: Scaffold(
        key: homeData.scaffold,
        drawer: BuildHomeDrawer(homeData: homeData),
        appBar: DefaultAppBar(
          title: tr(context, "home"),
          leading: InkWell(
            onTap: () {
              homeData.scaffold.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () => homeData.navigateToNotifications(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<GenericBloc<HomeModel?>, GenericState<HomeModel?>>(
          bloc: homeData.homeCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              if (state.data != null) {
                return LiquidPullToRefresh(
                  backgroundColor: Colors.white,
                  showChildOpacityTransition: false,
                  color: WidgetUtils.primaryColor.withOpacity(.5),
                  springAnimationDurationInMilliseconds: 500,
                  onRefresh: () async=> await homeData.fetchHome(context),
                  child: ListView(
                    children: [
                      Logo(),
                      BuildLatestNotifications(homeModel: state.data!, homeData: homeData),
                      BuildReceivedOrders(
                        model: state.data!,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                    child: MyText(
                  title: tr(context, "serverErrorTryLater"),
                  size: 10,
                  fontWeight: FontWeight.bold,
                ));
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
