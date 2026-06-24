part of 'wallet_widgets_imports.dart';

class WalletContent extends StatelessWidget {
  final WalletData walletData;

  const WalletContent({Key? key, required this.walletData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Res.imagesWallet),
        MyText(title: tr(context, "currentBalance"), size: 19, color: MyColors.blackOpacity),
        BlocBuilder<GenericBloc<int?>, GenericState<int?>>(
          bloc: walletData.walletBloc,
          builder: (context, state) {
            if(state is GenericUpdateState){
              return MyText(
                  title: state.data.toString(),
                  size: 39,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold);
            }else{
              return CupertinoActivityIndicator(color: MyColors.primary,);
            }

          },
        ),
        MyText(title: tr(context, "sarSuadia"), size: 16, color: MyColors.black),
      ],
    );
  }
}
