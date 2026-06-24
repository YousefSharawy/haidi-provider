class HomeModel {
  List<NotificationModel>? notificationsModel;
  int? orderServiceCount;
  int? orderProductCount;
  bool? dashboardConfirmed;

  HomeModel(
      {this.notificationsModel,
      this.orderServiceCount,
      this.orderProductCount,
      this.dashboardConfirmed});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notificationsModel = <NotificationModel>[];
      json['notifications'].forEach((v) {
        notificationsModel!.add(new NotificationModel.fromJson(v));
      });
    }
    orderServiceCount = json['orderServiceCount'];
    orderProductCount = json['orderProductCount'];
    dashboardConfirmed = json['dashboardConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationsModel != null) {
      data['notifications'] =
          this.notificationsModel!.map((v) => v.toJson()).toList();
    }
    data['orderServiceCount'] = this.orderServiceCount;
    data['orderProductCount'] = this.orderProductCount;
    data['dashboardConfirmed'] = this.dashboardConfirmed;
    return data;
  }
}

class NotificationModel {
  int? id;
  String? text;
  int? orderId;
  int? orderstatus;
  int? ordertype;

  NotificationModel(
      {this.id, this.text, this.orderId, this.orderstatus, this.ordertype});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    orderId = json['orderId'];
    orderstatus = json['orderstatus'];
    ordertype = json['ordertype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['orderId'] = this.orderId;
    data['orderstatus'] = this.orderstatus;
    data['ordertype'] = this.ordertype;
    return data;
  }
}
