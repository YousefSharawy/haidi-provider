// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      userName: json['userName'] as String?,
      placeName: json['placeName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      lang: json['lang'] as String?,
      isAvilable: json['isAvilable'] as bool?,
      imgProfile: json['imgProfile'] as String?,
      commercialRecord: json['commercialRecord'] as String?,
      taxRecord: json['taxRecord'] as String?,
      cityId: json['cityId'] as int?,
      description: json['description'] as String?,
      token: json['token'] as String?,
      typeUser: json['typeUser'] as int?,
      workdates: (json['workdates'] as List<dynamic>?)
          ?.map((e) => Workdate.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainCategories: (json['mainCategories'] as List<dynamic>?)
          ?.map((e) => MainCategorie.fromJson(e as Map<String, dynamic>))
          .toList(),
      activedByCode: json['activedByCode'] as bool?,
      confirmedByDashboard: json['confirmedByDashboard'] as bool?,
      location: json['location'] as String?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      cityName: json['cityName'] as String?,
    )..logo = json['logo'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'placeName': instance.placeName,
      'email': instance.email,
      'phone': instance.phone,
      'lang': instance.lang,
      'lat': instance.lat,
      'lng': instance.lng,
      'location': instance.location,
      'isAvilable': instance.isAvilable,
      'imgProfile': instance.imgProfile,
      'logo': instance.logo,
      'commercialRecord': instance.commercialRecord,
      'taxRecord': instance.taxRecord,
      'cityName': instance.cityName,
      'cityId': instance.cityId,
      'description': instance.description,
      'token': instance.token,
      'typeUser': instance.typeUser,
      'workdates': instance.workdates,
      'mainCategories': instance.mainCategories,
      'activedByCode': instance.activedByCode,
      'confirmedByDashboard': instance.confirmedByDashboard,
    };

Workdate _$WorkdateFromJson(Map<String, dynamic> json) => Workdate(
      id: json['id'] as int,
      day: json['day'] as int?,
      startHour: json['startHour'] as String?,
      endHour: json['endHour'] as String?,
      isClosed: json['isClosed'] as bool?,
      providerId: json['providerId'] as String?,
    );

Map<String, dynamic> _$WorkdateToJson(Workdate instance) => <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'startHour': instance.startHour,
      'endHour': instance.endHour,
      'isClosed': instance.isClosed,
      'providerId': instance.providerId,
    };

MainCategorie _$MainCategorieFromJson(Map<String, dynamic> json) =>
    MainCategorie(
      id: json['id'] as int,
      title: json['title'] as String?,
      taxRecord: json['taxRecord'] as String?,
      commercialNumber: json['commercialNumber'] as String?,
    );

Map<String, dynamic> _$MainCategorieToJson(MainCategorie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'taxRecord': instance.taxRecord,
      'commercialNumber': instance.commercialNumber,
    };
