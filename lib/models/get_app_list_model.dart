class GetAppListModel {
  bool status;
  List<Apps> apps;

  GetAppListModel({this.status, this.apps});

  GetAppListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['apps'] != null) {
      apps = new List<Apps>();
      json['apps'].forEach((v) {
        apps.add(new Apps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.apps != null) {
      data['apps'] = this.apps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Apps {
  int id;
  String appLogo;
  String appName;
  String appDescription;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Apps(
      {this.id,
      this.appLogo,
      this.appName,
      this.appDescription,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Apps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appLogo = json['app_logo'];
    appName = json['app_name'];
    appDescription = json['app_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_logo'] = this.appLogo;
    data['app_name'] = this.appName;
    data['app_description'] = this.appDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int clientId;
  int appId;

  Pivot({this.clientId, this.appId});

  Pivot.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    appId = json['app_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['app_id'] = this.appId;
    return data;
  }
}
