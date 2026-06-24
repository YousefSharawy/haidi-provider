class ServicesModel {
  int? id;
  int? userMainCategoryId;
  String? subCategoryName;
  String? userCategoryMain;
  int? mainCategoryType;
  List<Services>? services;
  bool? close;

  ServicesModel({
    this.id,
    this.close = true,
    this.userMainCategoryId,
    this.subCategoryName,
    this.userCategoryMain,
    this.mainCategoryType,
    this.services,
  });

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    close = json['close'] = true;
    userMainCategoryId = json['userMainCategoryId'];
    subCategoryName = json['subCategoryName'];
    userCategoryMain = json['userCategoryMain'];
    mainCategoryType = json['mainCategoryType'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userMainCategoryId'] = this.userMainCategoryId;
    data['subCategoryName'] = this.subCategoryName;
    data['userCategoryMain'] = this.userCategoryMain;
    data['mainCategoryType'] = this.mainCategoryType;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? nameAr;
  String? nameEn;
  int? timeTakesInMinutes;
  String? cancelTimeInHrs;
  int? price;
  bool? inMyCart;

  Services(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.timeTakesInMinutes,
      this.cancelTimeInHrs,
      this.price,
      this.inMyCart});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    timeTakesInMinutes = json['timeTakesInMinutes'];
    cancelTimeInHrs = json['cancelTimeInHrs'];
    price = json['price'];
    inMyCart = json['inMyCart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['timeTakesInMinutes'] = this.timeTakesInMinutes;
    data['cancelTimeInHrs'] = this.cancelTimeInHrs;
    data['price'] = this.price;
    data['inMyCart'] = this.inMyCart;
    return data;
  }
}
