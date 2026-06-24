part of 'HomeWidgetImports.dart';

class BuildHomeDrawer extends StatelessWidget {
  final HomeData homeData;

  const BuildHomeDrawer({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return Container(
      child: Drawer(
        backgroundColor: MyColors.primary,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                children: [
                  CachedImage(
                    url: user.imgProfile ?? '',
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(100),
                    borderColor: Colors.white,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: MyText(
                      title: user.userName ?? '',
                      size: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            BuildDrawerItem(
                icon: Icons.home_filled,
                title: tr(context, "home"),
                onTap: () => navigationKey.currentState!.pop()),
            BuildDrawerItem(
                icon: Icons.person,
                title: tr(context, "profile"),
                onTap: () => Nav.navigateTo(Account(),
                    navigatorType: NavigatorType.push)),
            BuildDrawerItem(
                icon: Icons.miscellaneous_services,
                title: tr(context, "services"),
                onTap: () => Nav.navigateTo(Services(),
                    navigatorType: NavigatorType.push)),
            BuildDrawerItem(
                icon: Icons.local_offer,
                title: tr(context, "offers"),
                onTap: () => Nav.navigateTo(Offers(),
                    navigatorType: NavigatorType.push)),
            BuildDrawerItem(
                icon: Icons.shopping_basket_rounded,
                title: tr(context, "store"),
                onTap: () =>
                    Nav.navigateTo(Store(), navigatorType: NavigatorType.push)),
            BuildDrawerItem(
                icon: Icons.wallet,
                title: tr(context, "wallet"),
                onTap: () => Nav.navigateTo(Wallet(),
                    navigatorType: NavigatorType.push)),
            BuildDrawerItem(
              icon: Icons.timer,
              title: tr(context, "workTimes"),
              onTap: () => Nav.navigateTo(WorkDates(),
                  navigatorType: NavigatorType.push),
            ),
            BuildDrawerItem(
              icon: Icons.group,
              title: tr(context, "contactUs"),
              onTap: () => Nav.navigateTo(
                const Contact(),
                navigatorType: NavigatorType.push,
              ),
            ),
            BuildDrawerItem(
              icon: Icons.branding_watermark_sharp,
              title: tr(context, "terms"),
              onTap: () => Nav.navigateTo(
                Terms(),
                navigatorType: NavigatorType.push,
              ),
            ),
            BuildDrawerItem(
              icon: Icons.login_rounded,
              title: tr(context, "logout"),
              onTap: () => GeneralRepository(context).logOut(),
            ),
            BuildDrawerItem(
              icon: Icons.delete,
              title: tr(context, "deleteAccount"),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BuildDeleteAccountAlertDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
