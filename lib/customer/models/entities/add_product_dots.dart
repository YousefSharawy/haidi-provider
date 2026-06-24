
import 'dart:io';

class AddProductDots {
  int? id; ///[ Use it in Edit Product only ]
  int? subCategoryId;
  int? count;
  double? delivery;
  String? descriptionAr;
  String? lang;
  String? titleAr;
  String? titleEn;
  String? descriptionEn;
  double? price;
  String? features;
  File? image ;
  List<int>? deletedFeatures ;



  AddProductDots({
    this.id,
    this.subCategoryId,
    this.descriptionAr,
    this.lang,
    this.titleAr,
    this.titleEn,
    this.descriptionEn,
    this.price,
    this.features,
    this.delivery,
    this.image,
    this.count,
    this.deletedFeatures,


  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "subCategoryId": subCategoryId,
    "lang": lang,
    "descriptionAr": descriptionAr,
    "titleAr": titleAr,
    "titleEn": titleEn,
    "descriptionEn": descriptionEn,
    "price": price,
    "features": features,
    "delivery": delivery,
    "count": count,
    "image": image,
    "deletedFeatures": deletedFeatures,


  };
}
