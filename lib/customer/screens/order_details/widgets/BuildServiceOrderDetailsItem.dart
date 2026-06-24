part of 'OrderDetailsWImports.dart';

class BuildServiceOrderDetailsItem extends StatelessWidget {
  final ServiceOrderDetailsModel  model ;
  const BuildServiceOrderDetailsItem({Key? key, required this.model}) : super(key: key);

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
                title: model.orderId.toString(),
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
                      title: '${tr(context, "serviceType")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    Expanded(
                      child: MyText(
                        title: model.serviceTitle??'',
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
                      title: '${tr(context, "servicePrice")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: '${model.servicePrice} ${tr(context, "sr")}',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "serviceTime")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title:model.orderTime??'',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: '${tr(context, "serviceDate")} : ',
                      size: 10,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title:model.orderDate??'',
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

