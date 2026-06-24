// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      id: json['id'] as int,
      parentId: json['parentId'] as int?,
      name: json['name'] as String?,
      img: json['img'] as String?,
      selected: json['selected'] as bool? ?? false,
      commercialRecord: json['commercialRecord'] as String?,
      taxRecord: json['taxRecord'] as String?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'img': instance.img,
      'taxRecord': instance.taxRecord,
      'commercialRecord': instance.commercialRecord,
      'selected': instance.selected,
    };
