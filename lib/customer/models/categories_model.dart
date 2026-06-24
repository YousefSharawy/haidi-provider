import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CategoriesModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'parentId')
  int? parentId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'img')
  String? img;
  @JsonKey(name: 'taxRecord')
  String? taxRecord;
  @JsonKey(name: 'commercialRecord')
  String? commercialRecord;
  @JsonKey(defaultValue: false)
  bool selected;
  File? tradePic ;
  File? taxPic ;


  CategoriesModel({required this.id, this.parentId, this.name, this.img,this.selected=false,this.commercialRecord,this.taxRecord, this.taxPic,this.tradePic,});

   factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

   Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}

