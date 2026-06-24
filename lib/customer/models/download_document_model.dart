class DownloadDocumentModel {
  String? description;
  String? documentLink;

  DownloadDocumentModel({this.description, this.documentLink});

  DownloadDocumentModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    documentLink = json['documentLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['documentLink'] = this.documentLink;
    return data;
  }
}