part of 'profileWidgetImports.dart';

class BuildProfileBody extends StatelessWidget {
  final ProfileData profileData;
  const BuildProfileBody({Key? key, required this.profileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: profileData.formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: tr(context, "name"),
          controller: profileData.placeName,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: tr(context, "userName"),
          controller: profileData.name,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.name,
          validate: (value) => value!.validateEmpty(context),
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: tr(context, "phone"),
          controller: profileData.phone,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.phone,
          validate: (value) => value!.validatePhone(context),
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: tr(context, "mail"),
          controller: profileData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmail(context),
        ),
        DropdownTextField<CitiesModels?>(
          itemAsString: (dynamic u) => u.name,
          dropKey: profileData.cityKey,
          hint: tr(context, "city"),
          validate: (CitiesModels? value) => value.validateDropDown(context),
          fontSize: 10,
          textSize: 12,
          fillColor: MyColors.secondary,
          radius: BorderRadius.circular(50),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          onChange: profileData.selectCity,
          useName: true,
          searchHint: tr(context, "city"),
          selectedItem: profileData.citiesModel,
          finData: (v) async => await GeneralRepository(context).getCities(),
        ),
        BlocConsumer<LocationCubit, LocationState>(
          bloc: profileData.locationCubit,
          listener: (context, state) {
            profileData.address.text = state.model?.address ?? "";
          },
          builder: (context, state) {
            return GenericTextField(
              fillColor: MyColors.secondary,
              fieldTypes: FieldTypes.clickable,
              hint: tr(context, "locationOnMap"),
              controller: profileData.address,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              type: TextInputType.text,
              action: TextInputAction.done,
              suffixIcon: Icon(Icons.my_location, size: 20),
              onTab: () => profileData.onLocationClick(context),
            );
          },
        ),
        BuildTaxPic(profileData: profileData),
        BuildTradePic(profileData: profileData),
        BuildLogoPic(profileData: profileData),
        GenericTextField(
          fieldTypes: FieldTypes.rich,
          max: 3,
          hint: tr(context, "description"),
          radius: BorderRadius.circular(20),
          controller: profileData.description,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.done,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        Row(
          children: [
            MyText(
              title: tr(context, "receivedNewOrders"),
              size: 11,
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: profileData.isAvailableBloc,
              builder: (context, state) {
                return Switch(
                    value: state.data,
                    onChanged: (value) {
                      profileData.changeIsAvailable(context, value);
                    });
              },
            ),

          ],
        )
      ]),
    );
  }
}
