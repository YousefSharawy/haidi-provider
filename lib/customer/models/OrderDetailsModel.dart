class marketOrderDetailsModel {
  String? location;
  String? phoneNumber;
  String? paymentType;
  List<OrderProducts>? orderProducts;

  marketOrderDetailsModel(
      {this.location, this.phoneNumber, this.paymentType, this.orderProducts});

  marketOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    phoneNumber = json['phoneNumber'];
    paymentType = json['paymentType'];
    if (json['orderProducts'] != null) {
      orderProducts = <OrderProducts>[];
      json['orderProducts'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['phoneNumber'] = this.phoneNumber;
    data['paymentType'] = this.paymentType;
    if (this.orderProducts != null) {
      data['orderProducts'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  int? id;
  String? productTitle;
  String? orderDate;
  int? quntity;
  int? price;

  OrderProducts(
      {this.id, this.productTitle, this.orderDate, this.quntity, this.price});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['productTitle'];
    orderDate = json['orderDate'];
    quntity = json['quntity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    data['orderDate'] = this.orderDate;
    data['quntity'] = this.quntity;
    data['price'] = this.price;
    return data;
  }
}