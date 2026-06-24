part of 'FinancialTransactionsWImports.dart';

class BuildFinancialInfo extends StatelessWidget {
  final FinancialTransactionsData financialTransactionsData;
  const BuildFinancialInfo({
    Key? key,
    required this.query,
    required this.financialTransactionsData,
  }) : super(key: key);

  final Size query;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<FinancialModel?>,
        GenericState<FinancialModel?>>(
      bloc: financialTransactionsData.notificationCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
         if(state.data !=null){
           return Column(
             children: [
               Expanded(
                 child: ListView(
                   physics: BouncingScrollPhysics(),
                   padding: EdgeInsets.symmetric(vertical: query.height / 5),
                   children: [
                     MyText(
                       alien: TextAlign.center,
                       title: state.data?.finishedOrders.toString() ?? '0',
                       size: 18,
                       fontWeight: FontWeight.bold,
                       maxLines: 1,
                     ),
                     MyText(
                       alien: TextAlign.center,
                       color: MyColors.blackOpacity,
                       title: tr(context, "totalOrders"),
                       size: 11,
                       fontWeight: FontWeight.bold,
                       maxLines: 1,
                     ),
                     const SizedBox(height: 40),
                     MyText(
                       alien: TextAlign.center,
                       title: '${state.data?.applicationDues ?? '0'} ${tr(context, "sar")}',
                       size: 18,
                       fontWeight: FontWeight.bold,
                       maxLines: 1,
                     ),
                     MyText(
                       alien: TextAlign.center,
                       color: MyColors.blackOpacity,
                       title: tr(context, "applicationCommission"),
                       size: 11,
                       fontWeight: FontWeight.bold,
                       maxLines: 1,
                     ),
                     const SizedBox(height: 40),
                     MyText(
                       alien: TextAlign.center,
                       title: '${state.data?.userDues ?? '0'} ${tr(context, "sar")}',
                       size: 18,
                       fontWeight: FontWeight.bold,
                       maxLines: 1,
                     ),
                     MyText(
                       alien: TextAlign.center,
                       color: MyColors.blackOpacity,
                       title: tr(context, "amountsOwed"),
                       size: 11,
                       fontWeight: FontWeight.bold,
                       maxLines: 1,
                     ),
                   ],
                 ),
               ),
               // if(state.data?.finishedOrders !=0)
               BuildFinancialButton(financialTransactionsData: financialTransactionsData)
             ],
           );
         }else{
          return Center(child: MyText(title: tr(context, "errorTryLater"), size: 10, fontWeight: FontWeight.bold,));
         }
        } else {  
          return Center(
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
