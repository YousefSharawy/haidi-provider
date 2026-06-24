class OrderModel {
  int? orderId;
  String? clientName;
  int? status;
  int? servicesCount;
  int? paymentType;
  num? price;

  OrderModel(
      {this.orderId,
        this.clientName,
        this.status,
        this.servicesCount,
        this.paymentType,
        this.price});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    clientName = json['clientName'];
    status = json['status'];
    servicesCount = json['servicesCount'];
    // paymentType is an int code here (0=Wallet,1=Visa,2=Mada,3=Sadad) but the
    // order-details model uses a String label for the same key. Tolerate a
    // non-int value (map it to Visa) instead of throwing, which would otherwise
    // collapse the whole orders list on parse.
    paymentType = json['paymentType'] is int
        ? json['paymentType'] as int
        : (json['paymentType'] != null ? 1 : null);
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['clientName'] = this.clientName;
    data['status'] = this.status;
    data['servicesCount'] = this.servicesCount;
    data['paymentType'] = this.paymentType;
    data['price'] = this.price;
    return data;
  }
}