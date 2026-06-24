class ServiceOrderDetailsModel {
  int? id;
  int? orderId;
  int? serviceId;
  int? servicePrice;
  String? serviceTitle;
  String? orderDate;
  String? orderTime;

  ServiceOrderDetailsModel(
      {this.id,
        this.orderId,
        this.serviceId,
        this.servicePrice,
        this.serviceTitle,
        this.orderDate,
        this.orderTime});

  ServiceOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    serviceId = json['serviceId'];
    servicePrice = json['servicePrice'];
    serviceTitle = json['serviceTitle'];
    orderDate = json['orderDate'];
    orderTime = json['orderTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['serviceId'] = this.serviceId;
    data['servicePrice'] = this.servicePrice;
    data['serviceTitle'] = this.serviceTitle;
    data['orderDate'] = this.orderDate;
    data['orderTime'] = this.orderTime;
    return data;
  }
}