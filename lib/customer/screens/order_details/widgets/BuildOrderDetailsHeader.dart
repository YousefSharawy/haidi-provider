part of 'OrderDetailsWImports.dart';

class BuildOrderDetailsHeader extends StatelessWidget {
  final marketOrderDetailsModel model ;
  const BuildOrderDetailsHeader({
    Key? key, required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                title: '${tr(context, "shippingAddress")} : ',
                size: 10,
                fontWeight: FontWeight.bold),
            Expanded(
              child: MyText(
                title: model.location??'${tr(context, "noAddress")}',
                size: 10,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            MyText(
                title: '${tr(context, "phone")} : ',
                size: 10,
                fontWeight: FontWeight.bold),
            MyText(
              title: model.phoneNumber??'${tr(context, "noPhone")}',
              size: 10,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            MyText(
                title: '${tr(context, "paymentMethod")} : ',
                size: 10,
                fontWeight: FontWeight.bold),
            MyText(
              title: model.paymentType??'',
              size: 10,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],),
    );
  }
}
