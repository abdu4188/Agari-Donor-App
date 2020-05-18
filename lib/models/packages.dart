class Packages {
  List<String> details;
  String sId;
  String name;
  String description;
  int iV;

  Packages({this.details, this.sId, this.name, this.description, this.iV});

  Packages.fromJson(Map<String, dynamic> json) {
    details = json['details'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}
