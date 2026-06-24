part of 'OrderDetailsImports.dart';



class OrderDetailsData {
  final GlobalKey<CustomButtonState> confirmBtnKey =  GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> refuseBtnKey =  GlobalKey<CustomButtonState>();
  final GenericBloc<marketOrderDetailsModel?> marketOrderDetailsCubit = GenericBloc(null);
  final GenericBloc<List<ServiceOrderDetailsModel>> serviceOrderDetailsCubit = GenericBloc([]);


  /// ============================ fetch order (market & Service ) ======>>>
  fetchOrderDetails(BuildContext context,{required bool isMarket , required int orderId}) async {
    if(isMarket){
      marketOrderDetailsModel? result = await CustomerRepository(context).getMarketOrderDetails(orderId: orderId);
      if(result!= null){
        marketOrderDetailsCubit.onUpdateData(result);
      }
    }else{
      List<ServiceOrderDetailsModel> result = await CustomerRepository(context).getServiceOrderDetails(orderId: orderId);
        serviceOrderDetailsCubit.onUpdateData(result);
    }
  }


  ///  ========================== order logic (market & Service ) =========================>>>

  acceptProductOrder(BuildContext context,{required bool isMarket,required int orderId}) async {
    if(isMarket){
      String? result = await CustomerRepository(context).acceptProductOrder(orderId:orderId);
      if(result!= null){
        CustomToast.showSimpleToast(msg: result);
        navigationKey.currentState!.pop(orderId);
      }
    }else {
      bool? result = await CustomerRepository(context).acceptServiceProductOrder(orderId:orderId);
      if(result){
        CustomToast.showSimpleToast(msg: tr(context, "serviceAccepted"));
        navigationKey.currentState!.pop(orderId);
      }
    }

  }
  refuseProductOrder(BuildContext context,{required bool isMarket,required int orderId}) async {
      bool? result = await CustomerRepository(context).refuseProductOrder(orderId:orderId, isMarket: isMarket);
      if(result != null){
        CustomToast.showSimpleToast(msg: tr(context, "serviceDenied"));
        navigationKey.currentState!.pop(orderId);
      }
  }
  finishProductOrder(BuildContext context,{required bool isMarket,required int orderId}) async {
      bool? result = await CustomerRepository(context).finishProductOrder(orderId:orderId, isMarket: isMarket);
      if(result != null){
        CustomToast.showSimpleToast(msg: tr(context, "orderFinishedReview"));
        navigationKey.currentState!.pop(orderId);
      }
  }

}