class SourceModel {
  SourceModel({  this.id,   this.name});
  String? id;
  String ?name;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }
}
