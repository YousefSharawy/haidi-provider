part of 'wallet_imports.dart';

class WalletData {

  final GenericBloc<int?> walletBloc =GenericBloc(0) ;


  fetchWallet(BuildContext context) async {
    int ? result = await CustomerRepository(context).getWallet();
    walletBloc.onUpdateData(result);
  }
}