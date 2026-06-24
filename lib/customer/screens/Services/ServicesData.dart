part of 'ServicesImports.dart';

class ServicesData {

  // <editor-fold desc="params">
  final GenericBloc<List<ServicesModel>> serviceBloc = GenericBloc([]);
  final GenericBloc<bool> paginationLoading = GenericBloc(false);
  final GenericBloc<int> filterPageKeyBloc = GenericBloc(1);
  final GenericBloc<bool> lastPage = GenericBloc(false);
  final ScrollController controller = ScrollController();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController serviceNameAr = TextEditingController();
  final TextEditingController serviceNameEn = TextEditingController();
  final TextEditingController timeDuration = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController timeEndDuration = TextEditingController();
  final GlobalKey<DropdownSearchState> MainCatKey = GlobalKey();
  final GlobalKey<DropdownSearchState> subCatKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnYesKey = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnNoKey = GlobalKey<CustomButtonState>();
  MainCatModel? mainCatModel;
  MainCatModel? subCatModel;
  // </editor-fold>

  // <editor-fold desc="Ui">
  void selectMainCat(MainCatModel? model) {
    mainCatModel = model != null ? model : null;
    if (mainCatModel == null) {
      subCatKey.currentState!.clear();
    }
  }
  void selectSubCat(MainCatModel? model) {
    subCatModel = model != null ? model : null;
  }

  toggleClose(int index) {
    serviceBloc.state.data[index].close = !serviceBloc.state.data[index].close!;
    serviceBloc.onUpdateData(serviceBloc.state.data);
  }
// </editor-fold>

  // <editor-fold desc="API Services">
  /// =====================fetch & Pagination ======================

  fetchServices(BuildContext context,
      {required int currentPage, bool firstTime = false}) async {
    List<ServicesModel> result =
        await CustomerRepository(context).getService(currentPage);
    serviceBloc.onUpdateData(result);
    if (firstTime) {
      serviceBloc.onUpdateData([]);
      serviceBloc.state.data.addAll(result);
      lastPage.onUpdateData(false);
      filterPageKeyBloc.onUpdateData(1);
    } else {
      serviceBloc.state.data.addAll(result);
    }
    if (result.length < 10) {
      lastPage.onUpdateData(true);
    }
    serviceBloc.onUpdateData(serviceBloc.state.data);
    paginationLoading.onUpdateData(false);
    log('============================== >>>>>>>>>>>>>>> last length ${serviceBloc.state.data.length}');
  }

  void servicePaginationListener(BuildContext context) {
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
        if (lastPage.state.data == false) {
          paginationLoading.onUpdateData(true);
          filterPageKeyBloc.onUpdateData(filterPageKeyBloc.state.data + 1);
          fetchServices(context,
              firstTime: false, currentPage: filterPageKeyBloc.state.data);
        }
      }
    });
  }

  /// ====================================================

  deleteService(
    BuildContext context, ServicesData servicesData ,{
    required int serviceId,
    required int mainIndex,
  }) async {
    Navigator.of(context).pop();
    bool result = await CustomerRepository(context).deleteService(serviceId);
    if (result) {
      serviceBloc.state.data[mainIndex].services!
          .removeWhere((element) => element.id == serviceId);
      serviceBloc.onUpdateData(serviceBloc.state.data);
    }
  }

  addService(BuildContext context, TickerProviderStateMixin ticker) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (mainCatModel?.id == null) {
      CustomToast.showSimpleToast(msg: tr(context, "plsEnterMainSection"));
      return;
    }
    if (subCatModel?.id == null) {
      CustomToast.showSimpleToast(msg: tr(context, "plsEnterBranchService"));
      return;
    }
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      AddServiceModel model = AddServiceModel(
          lang: DioUtils.lang,
          price: double.parse(price.text),
          titleAr: serviceNameAr.text,
          titleEn: serviceNameEn.text,
          userCategoryId: mainCatModel?.id ?? 0,
          subId: subCatModel?.id ?? 0,
          timeTakes: timeDuration.text,
          cancelationTime: timeEndDuration.text);
      bool result =
          await CustomerRepository(context).addService(addServiceModel: model);
      if (result) {
        price.clear();
        serviceNameAr.clear();
        serviceNameEn.clear();
        timeEndDuration.clear();
        timeDuration.clear();
        subCatModel = null;
        mainCatModel = null;
        MainCatKey.currentState?.clear();
        subCatKey.currentState?.clear();
        navigationKey.currentState!.pop();
        await CustomToast.navigateToDialog(
            context, ticker, BuildAddServiceSuccessDialog());
        btnKey.currentState!.animateReverse();
      }
      btnKey.currentState!.animateReverse();
    }
  }

  updateService(BuildContext context, TickerProviderStateMixin ticker,
      {required int serviceId}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (mainCatModel?.id == null) {
      CustomToast.showSimpleToast(msg: tr(context, "plsEnterMainSection"));
      return;
    }
    if (subCatModel?.id == null) {
      CustomToast.showSimpleToast(msg: tr(context, "plsEnterBranchService"));
      return;
    }
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      AddServiceModel model = AddServiceModel(
        lang: DioUtils.lang,
        price: double.parse(price.text),
        titleAr: serviceNameAr.text,
        titleEn: serviceNameEn.text,
        userCategoryId: mainCatModel?.id ?? 0,
        subId: subCatModel?.id ?? 0,
        timeTakes: timeDuration.text,
        cancelationTime: timeEndDuration.text,
        serviceId: serviceId,
      );
      List<ServicesModel>? result = await CustomerRepository(context).updateService(addServiceModel: model);
      log('=============first');
      serviceBloc.onUpdateData(result);
      btnKey.currentState!.animateReverse();
      navigationKey.currentState!.pop();
      await CustomToast.navigateToDialog(
          context, ticker, BuildEditServiceSuccessDialog());
    }
  }

  onServicePress(BuildContext context,TickerProviderStateMixin ticker,{ int? serviceId ,required bool editService}){
    if (!editService) {
      addService(context, ticker);
    } else {
      updateService(context, ticker,
          serviceId: serviceId??0 );
    }
  }
  // </editor-fold>

  // <editor-fold desc="init">

  void initDialog(
      {required bool editService,
      required int mainIndex,
      required int subIndex}) {
    var service = serviceBloc.state.data[mainIndex];
    if (editService) {
      serviceNameAr.text = service.services![subIndex].nameAr ?? '';
      serviceNameEn.text = service.services![subIndex].nameEn ?? '';
      timeDuration.text =
          service.services![subIndex].timeTakesInMinutes.toString();
      price.text = service.services![subIndex].price.toString();
      timeEndDuration.text =
          service.services![subIndex].cancelTimeInHrs.toString();
      mainCatModel = MainCatModel(
          id: service.userMainCategoryId, name: service.userCategoryMain);
      subCatModel = MainCatModel(id: service.id, name: service.subCategoryName);
    } else {
      serviceNameAr.clear();
      timeEndDuration.clear();
      price.clear();
      timeDuration.clear();
      serviceNameEn.clear();
      serviceNameAr.clear();
      mainCatModel = null;
      subCatModel = null;
    }
  }

  void dispose(BuildContext context) {
    controller.removeListener(() {
      servicePaginationListener(context);
    });
    controller.dispose();
  }
// </editor-fold>

}
