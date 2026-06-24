
class AddServiceModel {
  int? userCategoryId;
  int? serviceId;
  int? subId;
  String? lang;
  String? titleAr;
  String? titleEn;
  String? timeTakes;
  double? price;
  String? cancelationTime;



  AddServiceModel({
    this.userCategoryId,
    this.subId,
    this.lang,
    this.titleAr,
    this.titleEn,
    this.timeTakes,
    this.price,
    this.cancelationTime,
    this.serviceId,


  });

  Map<String, dynamic> toJson() => {
    "userCategoryId": userCategoryId,
    "lang": lang,
    "subId": subId,
    "titleAr": titleAr,
    "titleEn": titleEn,
    "timeTakes": timeTakes,
    "price": price,
    "cancelationTime": cancelationTime,
    "serviceId": serviceId,


  };
}
