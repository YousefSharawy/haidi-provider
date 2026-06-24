class OfferModel {
  int? id;
  String? offerImage;

  OfferModel({this.id, this.offerImage});

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerImage = json['offerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['offerImage'] = this.offerImage;
    return data;
  }
}