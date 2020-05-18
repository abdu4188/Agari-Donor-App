class Profile {
  Location location;
  String role;
  String sId;
  String name;
  String phone;
  String password;
  String date;
  int iV;
  String donation;

  Profile(
      {this.location,
      this.role,
      this.sId,
      this.name,
      this.phone,
      this.password,
      this.date,
      this.iV,
      this.donation});

  Profile.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    date = json['date'];
    iV = json['__v'];
    donation = json['donation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['donation'] = this.donation;
    return data;
  }
}

class Location {
  String lat;
  String lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
