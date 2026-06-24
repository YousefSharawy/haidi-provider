part of 'ServiceWImports.dart';

class BuildServiceDialog extends StatefulWidget {
  final bool editService;
  final ServicesData servicesData;
  final int? mainIndex;
  final int? subIndex;
  const BuildServiceDialog({
    Key? key,
    required this.servicesData,
    required this.editService,
    this.mainIndex,
    this.subIndex,
  }) : super(key: key);

  @override
  State<BuildServiceDialog> createState() => _BuildServiceDialogState();
}

class _BuildServiceDialogState extends State<BuildServiceDialog>
    with TickerProviderStateMixin {
  @override
  void initState() {
    if (widget.editService) {
      widget.servicesData.initDialog(
        mainIndex: widget.mainIndex ?? 0,
        subIndex: widget.subIndex ?? 0,
        editService: widget.editService,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.servicesData.mainCatModel = null;
    widget.servicesData.subCatModel = null;
    widget.servicesData.serviceNameAr.clear();
    widget.servicesData.serviceNameEn.clear();
    widget.servicesData.timeDuration.clear();
    widget.servicesData.price.clear();
    widget.servicesData.timeEndDuration.clear();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(0),
        actionsPadding: EdgeInsets.all(0),
        buttonPadding: EdgeInsets.all(0),
        title: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: Center(
            child: MyText(
              title:
                  widget.editService ? tr(context, "editBranchService") : tr(context, "addBranchService"),
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          ),
        ),
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.4,
          child: Form(
            key: widget.servicesData.formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    children: [
                      MyText(
                          title: tr(context, "mainSection"),
                          size: 9,
                          fontWeight: FontWeight.bold),
                      DropdownTextField<MainCatModel?>(
                        itemAsString: (dynamic u) => u.name,
                        dropKey: widget.servicesData.MainCatKey,
                        hint: tr(context, "selectMainSection"),
                        validate: (MainCatModel? value) =>
                            value.validateDropDown(context),
                        fontSize: 10,
                        textSize: 12,
                        fillColor: MyColors.secondary,
                        radius: BorderRadius.circular(50),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        onChange: widget.servicesData.selectMainCat,
                        useName: true,
                        selectedItem: widget.servicesData.mainCatModel,
                        finData: (v) async => await CustomerRepository(context).getMainCatUser(),
                      ),
                      MyText(
                          title: tr(context, "branchService"),
                          size: 9,
                          fontWeight: FontWeight.bold),
                      DropdownTextField<MainCatModel?>(
                        itemAsString: (dynamic u) => u.name,
                        dropKey: widget.servicesData.subCatKey,
                        hint: tr(context, "selectBranchService"),
                        validate: (MainCatModel? value) =>
                            value.validateDropDown(context),
                        fontSize: 10,
                        textSize: 12,
                        fillColor: MyColors.secondary,
                        radius: BorderRadius.circular(50),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        onChange: widget.servicesData.selectSubCat,
                        useName: true,
                        selectedItem: widget.servicesData.subCatModel,
                        finData: (v) async => await CustomerRepository(context).getSubCatUser(
                                widget.servicesData.mainCatModel?.parentId ??
                                    0),
                      ),
                      MyText(
                          title: tr(context, "serviceNameAr"),
                          size: 9,
                          fontWeight: FontWeight.bold),
                      GenericTextField(
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "serviceNameAr") ,
                        controller: widget.servicesData.serviceNameAr,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(
                          title: tr(context, "serviceNameEn"),
                          size: 9,
                          fontWeight: FontWeight.bold),
                      GenericTextField(
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "serviceNameEn"),
                        controller: widget.servicesData.serviceNameEn,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(
                          title: tr(context, "durationInMin"),
                          size: 9,
                          fontWeight: FontWeight.bold),
                      GenericTextField(
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "durationInMin"),
                        controller: widget.servicesData.timeDuration,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        action: TextInputAction.next,
                        type: TextInputType.number,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(
                          title: tr(context, "price"), size: 9, fontWeight: FontWeight.bold),
                      GenericTextField(
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "price"),
                        controller: widget.servicesData.price,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        action: TextInputAction.next,
                        type: TextInputType.number,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(
                          title: tr(context, "cancelOrderInHr"),
                          size: 9,
                          fontWeight: FontWeight.bold),
                      GenericTextField(
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "cancelOrderInHr"),
                        controller: widget.servicesData.timeEndDuration,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        action: TextInputAction.next,
                        type: TextInputType.number,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                    ],
                  ),
                ),
                LoadingButton(
                  borderRadius: 40,
                  btnKey: widget.servicesData.btnKey,
                  title: widget.editService ? tr(context, "update") : tr(context, "add"),
                  onTap: () {
                    var serviceId =widget.mainIndex==null ? 0: widget
                        .servicesData
                        .serviceBloc
                        .state
                        .data[widget.mainIndex ?? 0]
                        .services?[widget.subIndex ?? 0].id ;
                    widget.servicesData.onServicePress(
                      context,
                      this,
                      serviceId: serviceId,
                      editService: widget.editService,
                    );
                  },
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
