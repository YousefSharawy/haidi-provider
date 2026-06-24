import 'package:json_annotation/json_annotation.dart'; 

part 'cities_models.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CitiesModels {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String? name;

  CitiesModels({required this.id, this.name});

   factory CitiesModels.fromJson(Map<String, dynamic> json) => _$CitiesModelsFromJson(json);

   Map<String, dynamic> toJson() => _$CitiesModelsToJson(this);
}

