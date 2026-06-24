class EditCatModel {
  int? id;
  int? parentId;
  String? name;
  String? img;
  String? commercialRecord;
  String? taxRecord;

  EditCatModel(
      {this.id,
        this.parentId,
        this.name,
        this.img,
        this.commercialRecord,
        this.taxRecord});

  EditCatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    name = json['name'];
    img = json['img'];
    commercialRecord = json['commercialRecord'];
    taxRecord = json['taxRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['commercialRecord'] = this.commercialRecord;
    data['taxRecord'] = this.taxRecord;
    return data;
  }
}