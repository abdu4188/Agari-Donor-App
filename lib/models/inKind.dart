class InkindModel {
  String status;
  String sId;
  Package package;
  String type;
  String donator;
  String created;
  int iV;

  InkindModel(
      {this.status,
      this.sId,
      this.package,
      this.type,
      this.donator,
      this.created,
      this.iV});

  InkindModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    package =
        json['package'] != null ? new Package.fromJson(json['package']) : null;
    type = json['type'];
    donator = json['donator'];
    created = json['created'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    if (this.package != null) {
      data['package'] = this.package.toJson();
    }
    data['type'] = this.type;
    data['donator'] = this.donator;
    data['created'] = this.created;
    data['__v'] = this.iV;
    return data;
  }
}

class Package {
  List<String> details;
  String sId;
  String name;
  String description;
  int iV;

  Package({this.details, this.sId, this.name, this.description, this.iV});

  Package.fromJson(Map<String, dynamic> json) {
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
