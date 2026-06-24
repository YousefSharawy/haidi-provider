import 'package:flutter/material.dart';

class WorkTimeModel {
  int? id ;
  String? day;
  int? dayNum;
  TextEditingController? from;
  TextEditingController? to;
  String? startHour;
  String? endHour;
  bool isClosed;

  WorkTimeModel({
    this.id,
    this.day,
    this.from ,
    this.to,
    this.startHour,
    this.endHour,
    this.dayNum,
    this.isClosed = false,
  });

  Map<String, dynamic> toJson() => {
        'day': dayNum,
        'startHour': startHour,
        'endHour': endHour,
        'isClosed': isClosed,
      };

  static List<WorkTimeModel> initList = [
    WorkTimeModel(day: 'السبت',dayNum: 1,from: TextEditingController(),to: TextEditingController(),),
    WorkTimeModel(day: 'الاحد',dayNum: 2,from: TextEditingController(),to: TextEditingController()),
    WorkTimeModel(day: 'الأثنين',dayNum: 3,from: TextEditingController(),to: TextEditingController()),
    WorkTimeModel(day: 'الثلاثاء',dayNum: 4,from: TextEditingController(),to: TextEditingController()),
    WorkTimeModel(day: 'الأربعاء',dayNum: 5,from: TextEditingController(),to: TextEditingController()),
    WorkTimeModel(day: 'الخميس',dayNum: 6,from: TextEditingController(),to: TextEditingController()),
    WorkTimeModel(day: 'الجمعة',dayNum: 7,from: TextEditingController(),to: TextEditingController(),),
  ];

}
