part of 'FinancialTransactionsImports.dart';

class FinancialTransactions extends StatefulWidget {
  const FinancialTransactions({Key? key}) : super(key: key);

  @override
  State<FinancialTransactions> createState() => _FinancialTransactionsState();
}

class _FinancialTransactionsState extends State<FinancialTransactions> {
  final FinancialTransactionsData financialTransactionsData =  FinancialTransactionsData();
  @override
  void initState() {
    financialTransactionsData.fetchNotification(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size ;
    return AuthScaffold(
      title: tr(context, "financialTransactions"),
      back: true,
      body:  BuildFinancialInfo(query: query, financialTransactionsData: financialTransactionsData),
    );
  }
}


