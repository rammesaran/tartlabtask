class LoginRequestModel {
  String clientId;
  String clientSecret;
  String username;
  String password;
  String grantType;
  String providers;

  LoginRequestModel(
      {this.clientId,
      this.clientSecret,
      this.username,
      this.password,
      this.grantType,
      this.providers});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    username = json['username'];
    password = json['password'];
    grantType = json['grant_type'];
    providers = json['providers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_secret'] = this.clientSecret;
    data['username'] = this.username;
    data['password'] = this.password;
    data['grant_type'] = this.grantType;
    data['providers'] = this.providers;
    return data;
  }
}
