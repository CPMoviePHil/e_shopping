
class UserModel {
  int id;
  String account;
  String userName;
  String profile;

  UserModel({this.id, this.account, this.userName, this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    userName = json['user_name'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account'] = this.account;
    data['user_name'] = this.userName;
    data['profile'] = this.profile;
    return data;
  }
}
