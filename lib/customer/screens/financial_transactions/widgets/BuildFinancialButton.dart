part of'FinancialTransactionsWImports.dart';

class BuildFinancialButton extends StatelessWidget {
  final FinancialTransactionsData financialTransactionsData;
  const BuildFinancialButton({
    Key? key, required this.financialTransactionsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
        onTap: () =>financialTransactionsData.financialSettelment(context),
        title: tr(context, "balanceSettlement"),
        margin: EdgeInsets.zero,
        height: 50,
        fontSize: 12,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)));
  }
}
