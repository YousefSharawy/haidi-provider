part of 'wallet_imports.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final WalletData walletData = WalletData();
  @override
  void initState() {
    walletData.fetchWallet(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(title: tr(context, "wallet"),
      back: true,

      body: Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
            children: [
              WalletContent(walletData: walletData)
            ],
          ),
        ),
        DefaultButton(
            onTap: () =>Nav.navigateTo( FinancialTransactions(), navigatorType: NavigatorType.push),
            title: tr(context, "financialTransactions"),
            margin: EdgeInsets.zero,
            height: 50,
            fontSize: 12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)))
      ],
    ),);
  }
}
