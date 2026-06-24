import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class UserModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'placeName')
  String? placeName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'isAvilable')
  bool? isAvilable;
  @JsonKey(name: 'imgProfile')
  String? imgProfile;
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'commercialRecord')
  String? commercialRecord;
  @JsonKey(name: 'taxRecord')
  String? taxRecord;
  @JsonKey(name: 'cityName')
  String? cityName;
  @JsonKey(name: 'cityId')
  int? cityId;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'typeUser')
  int? typeUser;
  @JsonKey(name: 'workdates')
  List<Workdate>? workdates;
  @JsonKey(name: 'mainCategories')
  List<MainCategorie>? mainCategories;
  @JsonKey(name: 'activedByCode')
  bool? activedByCode;
  @JsonKey(name: 'confirmedByDashboard')
  bool? confirmedByDashboard;

  UserModel({
    required this.id,
    this.userName,
    this.placeName,
    this.email,
    this.phone,
    this.lang,
    this.isAvilable,
    this.imgProfile,
    this.commercialRecord,
    this.taxRecord,
    this.cityId,
    this.description,
    this.token,
    this.typeUser,
    this.workdates,
    this.mainCategories,
    this.activedByCode,
    this.confirmedByDashboard,
    this.location,
    this.lng,
    this.lat,
    this.cityName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Workdate {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'day')
  int? day;
  @JsonKey(name: 'startHour')
  String? startHour;
  @JsonKey(name: 'endHour')
  String? endHour;
  @JsonKey(name: 'isClosed')
  bool? isClosed;
  @JsonKey(name: 'providerId')
  String? providerId;

  Workdate(
      {required this.id,
      this.day,
      this.startHour,
      this.endHour,
      this.isClosed,
      this.providerId});

  factory Workdate.fromJson(Map<String, dynamic> json) =>
      _$WorkdateFromJson(json);

  Map<String, dynamic> toJson() => _$WorkdateToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MainCategorie {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'taxRecord')
  String? taxRecord;
  @JsonKey(name: 'commercialNumber')
  String? commercialNumber;

  MainCategorie({
    required this.id,
    this.title,
    this.taxRecord,
    this.commercialNumber,
  });

  factory MainCategorie.fromJson(Map<String, dynamic> json) =>
      _$MainCategorieFromJson(json);

  Map<String, dynamic> toJson() => _$MainCategorieToJson(this);
}
