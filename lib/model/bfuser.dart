class BFUser {
  String? fullname;
  String? email;
  String? type;
  String? license;
  int? createdAt;

  BFUser({this.fullname, this.email, this.type, this.license, this.createdAt});

  BFUser.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    type = json['type'];
    license = json['license'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['type'] = this.type;
    data['license'] = this.license;
    data['createdAt'] = this.createdAt;
    return data;
  }
}