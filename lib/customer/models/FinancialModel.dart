
import 'dart:convert';
class FinancialModel {
  FinancialModel({
    this.finishedOrders,
    this.userDues,
    this.applicationDues,
  });

  num? finishedOrders;
  num? userDues;
  num? applicationDues;

  factory FinancialModel.fromJson(Map<String, dynamic> json) => FinancialModel(
    finishedOrders: json["finishedOrders"],
    userDues: json["userDues"],
    applicationDues: json["applicationDues"],
  );

  Map<String, dynamic> toJson() => {
    "finishedOrders": finishedOrders,
    "userDues": userDues,
    "applicationDues": applicationDues,
  };

  FinancialModel financialModelFromJson(String str) => FinancialModel.fromJson(json.decode(str));

  String financialModelToJson(FinancialModel data) => json.encode(data.toJson());
}
