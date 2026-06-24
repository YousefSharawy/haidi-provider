part of 'OrderDetailsWImports.dart';

class BuildMarketOrderDetailsItem extends StatelessWidget {
  final OrderDetailsData orderDetailsData;

  final OrderProducts model;

  final marketOrderDetailsModel marketDetailsModel;

  const BuildMarketOrderDetailsItem({
    Key? key,
    required this.orderDetailsData,
    required this.model,
    required this.marketDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: Offset(0, 5))
          ]),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(
                Res.imagesLogo,
                scale: 35,
              ),
              MyText(
                title: tr(context, "orderNum"),
                size: 10,
                fontWeight: FontWeight.bold,
                color: MyColors.blackOpacity,
              ),
              MyText(
                title: model.price.toString(),
                size: 10,
                fontWeight: FontWeight.bold,
                color: MyColors.blackOpacity,
              ),
            ],
          ),
          SizedBox(child: VerticalDivider(), height: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: '${tr(context, "productName")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    Expanded(
                      child: MyText(
                        title: model.productTitle ?? '',
                        size: 10,
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        color: MyColors.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "productPrice")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: '${model.price} ${tr(context, "sr")}',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "orderDate")}  : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: model.orderDate ?? '',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "serviceNumber")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: model.quntity.toString(),
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: '${tr(context, "shippingAddress")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    Expanded(
                      child: MyText(
                        title: marketDetailsModel.location ?? '${tr(context, "noAddress")}',
                        maxLines: 2,
                        size: 10,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "phone")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: '${marketDetailsModel.phoneNumber}',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "paymentMethod")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: '${marketDetailsModel.paymentType}',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
