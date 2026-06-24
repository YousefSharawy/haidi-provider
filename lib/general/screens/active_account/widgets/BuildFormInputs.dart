part of 'ActiveAccountWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ActiveAccountData activeAccountData;

  const BuildFormInputs({required this.activeAccountData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: activeAccountData.formKey,
      child: GenericTextField(
        hintColor:
            Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
        fieldTypes: FieldTypes.normal,
        hint: tr(context, "activeCode"),
        controller: activeAccountData.code,
        margin: const EdgeInsets.symmetric(vertical: 10),
        action: TextInputAction.next,
        type: TextInputType.number,
        validate: (value) => value!.validateEmpty(context),
      ),
    );
  }
}
