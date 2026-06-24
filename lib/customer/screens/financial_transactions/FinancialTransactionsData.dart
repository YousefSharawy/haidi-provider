part of'FinancialTransactionsImports.dart';


class FinancialTransactionsData {

  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();

  final GenericBloc<FinancialModel?> notificationCubit = GenericBloc(null);

  fetchNotification(BuildContext context) async {
    FinancialModel? result = await CustomerRepository(context).getFinancial();
    notificationCubit.onUpdateData(result);
  }
  financialSettelment(BuildContext context) async {
   bool? result = await CustomerRepository(context).financialSettelment();
    if(result ==true){
      notificationCubit.onUpdateData(FinancialModel(applicationDues: 0,finishedOrders: 0,userDues: 0));
    }
  }


}