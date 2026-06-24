part of 'AccountImports.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context,"profile"),
      back: true,
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: TabBar(
                    onTap: (index) {},
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(color: MyColors.primary,borderRadius: BorderRadius.circular(10)),
                    tabs: [
                      Tab(text: tr(context, "fileInfo")),
                      Tab(text: tr(context, "sectionsInfo")),
                    ]),
              ),
              Expanded(child: TabBarView(children: [
                Profile(),
                Categories(),

              ]))
            ],
          )),
    );
  }
}
