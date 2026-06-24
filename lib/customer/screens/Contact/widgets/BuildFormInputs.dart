part of 'ContactWidgetImports.dart';

class BuildContactFormInputs extends StatelessWidget {
  final ContactData contactData;
  const BuildContactFormInputs({required this.contactData});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: contactData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "name"),
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: '',
            controller: contactData.name,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "mail"),
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: '',
            controller: contactData.mail,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmail(context),
          ),
          MyText(
            title: tr(context, "phone"),
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: '',
            controller: contactData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validatePhone(context),
          ),
          MyText(
            title: tr(context, "message"),
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.rich,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: '',
            controller: contactData.msg,
            max: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            radius: BorderRadius.circular(15),
            validate: (value) => value!.validateEmpty(context),
          ),
        ],
      ),
    );
  }
}
