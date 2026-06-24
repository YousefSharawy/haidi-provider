part of 'RegisterWidgetsImports.dart';

class BuildRegisterInputs extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterInputs({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: registerData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            label: tr(context, "name"),
            controller: registerData.placeName,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            label: tr(context, "userName"),
            controller: registerData.userName,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            label: tr(context, "phone"),
            controller: registerData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validatePhone(context),
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            label: tr(context, "mail"),
            controller: registerData.email,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            label: tr(context, "commercialNum"),
            controller: registerData.taxNum,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
          ),
          BuildTradePic(dark: dark, registerData: registerData),
          BuildTaxPic(dark: dark, registerData: registerData),
          BuildLogoPic(dark: dark, registerData: registerData),
          BlocConsumer<LocationCubit, LocationState>(
            bloc: registerData.locationCubit,
            listener: (context, state) {
              registerData.address.text = state.model?.address ?? "";
            },
            builder: (context, state) {
              return GenericTextField(
                fillColor: MyColors.secondary,
                fieldTypes: FieldTypes.clickable,
                label: tr(context, "locationOnMap"),
                controller: registerData.address,
                validate: (value) => value!.validateEmpty(context),
                margin: const EdgeInsets.symmetric(vertical: 10),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                type: TextInputType.text,
                action: TextInputAction.done,
                suffixIcon: Icon(Icons.my_location, size: 20),
                onTab: () => registerData.onLocationClick(context),
              );
            },
          ),
          DropdownTextField<CitiesModels?>(
            itemAsString: (dynamic u) => u.name,
            dropKey: registerData.cityKey,
            label: tr(context, "city"),
            validate: (CitiesModels? value) => value.validateDropDown(context),
            fontSize: 10,
            textSize: 12,
            fillColor: MyColors.secondary,
            radius: BorderRadius.circular(50),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            onChange: registerData.selectCity,
            useName: true,
            searchHint: tr(context, "city"),
            selectedItem: registerData.citiesModel,
            finData: (v) async => await GeneralRepository(context).getCities(),
          ),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: registerData.passwordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: tr(context, "password"),
                controller: registerData.password,
                action: TextInputAction.next,
                fillColor: dark ? Colors.transparent : MyColors.textFields,
                type: TextInputType.text,
                validate: (value) => value!.validatePassword(context),
                suffixIcon: IconButton(
                  icon: state.data
                      ? Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    registerData.passwordBloc.onUpdateData(!state.data);
                  },
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: registerData.confirmPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                label: tr(context, "confirmPassword"),
                controller: registerData.confirmPassword,
                action: TextInputAction.done,
                type: TextInputType.text,
                fillColor: dark ? Colors.transparent : MyColors.textFields,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: registerData.password.text),
                suffixIcon: IconButton(
                  icon: state.data
                      ? Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    registerData.confirmPasswordBloc.onUpdateData(!state.data);
                  },
                ),
                onSubmit: () {},
              );
            },
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.rich,
            max: 3,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            label: tr(context, "description"),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            radius: BorderRadius.circular(20),
            controller: registerData.description,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          Row(
            children: [
              BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: registerData.termsAgreement,
                builder: (context, state) {
                  return Checkbox(
                    value: state.data,
                    onChanged: (value) =>
                        registerData.termsAgreement.onUpdateData(!state.data),
                  );
                },
              ),
              MyText(title: tr(context, "termsAgree"), size: 10),
              InkWell(
                onTap: () =>
                    Nav.navigateTo(Terms(), navigatorType: NavigatorType.push),
                child: MyText(
                  title: tr(context, "conditions"),
                  size: 10,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
