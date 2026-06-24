import 'package:flutter/material.dart';

class PrimaryFeatures {
   int? id;
  // late final int? featureNum;
  TextEditingController? arabicFeature;
  TextEditingController? englishFeature;

  PrimaryFeatures( {
    this.id,
    // this.featureNum,
    this.arabicFeature,
    this.englishFeature,
  });

  Map<String, dynamic> toJson() =>
      {
        'id': id,
      };

  //
  // static List<PrimaryFeatures> initList = [
  //   PrimaryFeatures(arabicFeature: TextEditingController(),
  //       englishFeature: TextEditingController(),
  //       featureNum: 1),
  //   PrimaryFeatures(arabicFeature: TextEditingController(),
  //       englishFeature: TextEditingController(),
  //       featureNum: 2),
  //   PrimaryFeatures(arabicFeature: TextEditingController(),
  //       englishFeature: TextEditingController(),
  //       featureNum: 3),
  //   PrimaryFeatures(arabicFeature: TextEditingController(),
  //       englishFeature: TextEditingController(),
  //       featureNum: 4),
  //   PrimaryFeatures(arabicFeature: TextEditingController(),
  //       englishFeature: TextEditingController(),
  //       featureNum: 5),
  // ];
}