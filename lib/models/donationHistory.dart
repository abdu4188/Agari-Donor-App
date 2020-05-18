class DonationHistoryModel {
  String status;
  String sId;
  String package;
  String type;
  String donator;
  String created;
  int iV;

  DonationHistoryModel(
      {this.status,
      this.sId,
      this.package,
      this.type,
      this.donator,
      this.created,
      this.iV});

  DonationHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    package = json['package'];
    type = json['type'];
    donator = json['donator'];
    created = json['created'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['package'] = this.package;
    data['type'] = this.type;
    data['donator'] = this.donator;
    data['created'] = this.created;
    data['__v'] = this.iV;
    return data;
  }
}
