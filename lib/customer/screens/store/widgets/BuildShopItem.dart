part of 'StoreWImports.dart';

class BuildShopItem extends StatelessWidget {
  final StoreData storeData;
  final ProductModel model;

  const BuildShopItem({
    Key? key,
    required this.storeData,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            CachedImage(
              url: model.image ?? '',
              height: 150,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => BuildDeleteStoreDialog(
                                    storeData: storeData, model: model)),
                            child: Icon(
                              Icons.cancel_sharp,
                              color: MyColors.primary,
                            )),
                        const SizedBox(width: 5),
                        InkWell(
                            onTap: () => storeData
                                .navigateToEditProduct(context, model: model),
                            child: Icon(
                              Icons.edit_outlined,
                              color: MyColors.primary,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        MyText(
          title: model.userName ?? '',
          size: 8,
          color: MyColors.blackOpacity,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        MyText(
          title:
              DioUtils.lang == "ar" ? model.nameAr ?? '' : model.nameEn ?? '',
          size: 9,
          color: MyColors.black,
          fontWeight: FontWeight.bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        MyText(
          title: '${model.price} ${tr(context, "sr")}',
          size: 10,
          color: MyColors.primary,
          fontWeight: FontWeight.bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
