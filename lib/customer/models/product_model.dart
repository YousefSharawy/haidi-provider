class ProductModel {
  int? id;
  int? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  String? userName;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  int? count;
  String? image;
  int? price;
  int? delivery;
  List<Features>? features;

  ProductModel(
      {this.id,
        this.categoryId,
        this.categoryNameAr,
        this.categoryNameEn,
        this.userName,
        this.nameAr,
        this.nameEn,
        this.descriptionAr,
        this.descriptionEn,
        this.count,
        this.image,
        this.price,
        this.delivery,
        this.features});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    categoryNameAr = json['categoryNameAr'];
    categoryNameEn = json['categoryNameEn'];
    userName = json['userName'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    descriptionAr = json['descriptionAr'];
    descriptionEn = json['descriptionEn'];
    count = json['count'];
    image = json['image'];
    price = json['price'];
    delivery = json['delivery'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['categoryNameAr'] = this.categoryNameAr;
    data['categoryNameEn'] = this.categoryNameEn;
    data['userName'] = this.userName;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['descriptionAr'] = this.descriptionAr;
    data['descriptionEn'] = this.descriptionEn;
    data['count'] = this.count;
    data['image'] = this.image;
    data['price'] = this.price;
    data['delivery'] = this.delivery;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  int? id;
  String? featureAr;
  String? featureEn;

  Features({this.id, this.featureAr, this.featureEn});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    featureAr = json['featureAr'];
    featureEn = json['featureEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['featureAr'] = this.featureAr;
    data['featureEn'] = this.featureEn;
    return data;
  }
}