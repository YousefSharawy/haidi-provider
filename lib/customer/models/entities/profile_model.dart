import 'dart:io';

class ProfileModel {
  String? providerId;
  String? lang;
  String? name;
  String? placeName;
  int? cityId;
  String? email;
  File? profileImg;
  String? phone;
  String? description;
  String? lat;
  String? lng;
  String? location;
  bool? isAvailable;
  File? logoImg;
  File? commercialRecordImg;
  File? taxRecordImg;

  ProfileModel({
    this.providerId,
    this.lang,
    this.name,
    this.placeName,
    this.cityId,
    this.email,
    this.phone,
    this.lat,
    this.lng,
    this.location,
    this.profileImg,
    this.description,
    this.isAvailable,
    this.logoImg,
    this.commercialRecordImg,
    this.taxRecordImg,
  });

  Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "lang": lang,
        "userName": name,
        "placeName": placeName,
        "cityId": cityId,
        "phone": phone,
        "email": email,
        "lat": lat,
        "lng": lng,
        "location": location,
        "profileImg": profileImg,
        "description": description,
        "isAvailable": isAvailable,
        "logo": logoImg,
        "commercialRecordImg": commercialRecordImg,
        "taxRecordImg": taxRecordImg,
      };
}
