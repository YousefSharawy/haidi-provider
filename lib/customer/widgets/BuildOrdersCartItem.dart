import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/res/res.dart';
import 'package:flutter/material.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

class BuildOrdersCartItem extends StatelessWidget {
  final String? clientName;
  final String? orderNum;
  final String? serviceNum;
  final double? price;
  final int? paymentType;
  final GestureTapCallback? onTap;

  const BuildOrdersCartItem({
    Key? key,
    this.clientName,
    this.orderNum,
    this.serviceNum,
    this.price,
    this.paymentType,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            Image.asset(
              Res.imagesLogo,
              scale: 35,
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
                        title: 'اسم العميل : ',
                        size: 10,
                        fontWeight: FontWeight.bold,
                        color: MyColors.blackOpacity,
                      ),
                      Expanded(
                        child: MyText(
                          title: clientName ?? 'اوامر الشبكه',
                          size: 10,
                          fontWeight: FontWeight.bold,
                          maxLines: 2,
                          color: MyColors.primary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MyText(
                            title: 'رقم الطلب : ',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackOpacity,
                          ),
                          MyText(
                            title: orderNum ?? '100',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyText(
                            title: 'المبلغ  : ',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackOpacity,
                          ),
                          MyText(
                            title: price.toString(),
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MyText(
                            title: 'العدد : ',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackOpacity,
                          ),
                          MyText(
                            title: serviceNum ?? '100',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyText(
                            title: 'الدفع : ',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackOpacity,
                          ),
                          MyText(
                            title: paymentType == 0
                                ? tr(context , 'Wallet')
                                : paymentType == 1
                                    ? tr(context , 'Visa')
                                    : paymentType == 2
                                        ? tr(context , 'Mada')
                                        : paymentType == 3
                                            ? tr(context , 'Sadad')
                                            : '',
                            size: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
