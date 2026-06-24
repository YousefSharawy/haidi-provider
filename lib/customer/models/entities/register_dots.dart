import 'dart:io';

class RegisterEntities{
  String? placeName;
  String? userName;
  String? email;
  File? profileImage;
  File? commercialRecord;
  File? taxRecord;
  File? logoPic;
  String? phone;
  String? lat;
  String? lng;
  String? location;
  String? description;
  String? password;
  String? deviceId;
  String? deviceType;
  String? projectName;
  String? lang;
  int? cityId;
  String? taxRecordText;

  RegisterEntities({
    this.placeName,
    this.phone,
    this.email,
    this.profileImage,
    this.userName,
    this.lat,
    this.lng,
    this.location,
    this.commercialRecord,
    this.taxRecord,
    this.logoPic,
    this.description,
    this.password,
    this.deviceId,
    this.deviceType,
    this.projectName,
    this.lang,
    this.cityId,
    this.taxRecordText,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "placeName": placeName,
    "email": email,
    "profileImage": profileImage,
    "userName": userName,
    "lat": lat,
    "lng": lng,
    "location": location,
    "commercialRecord": commercialRecord,
    "taxRecord": taxRecord,
    "logo": logoPic,
    "description": description,
    "password": password,
    "deviceId": deviceId,
    "deviceType": deviceType,
    "projectName": projectName,
    "lang": lang,
    "cityId": cityId,
    "taxRecordText": taxRecordText,
  };
}