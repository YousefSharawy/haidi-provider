part of 'ForgetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildFormInputs({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: forgerPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            margin: const EdgeInsets.symmetric(vertical: 10),
            hint: tr(context, "phone"),
            controller: forgerPasswordData.phone,
            action: TextInputAction.done,
            type: TextInputType.number,
            validate: (value) => value!.validatePhone(context),
            onSubmit: () => forgerPasswordData.onForgetPassword(context),
          ),
        ],
      ),
    );
  }
}
