import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmToken;
  final Timestamp? addTiem;
  UserData(
      {this.id,
      this.name,
      this.email,
      this.photoUrl,
      this.location,
      this.fcmToken,
      this.addTiem});
  factory UserData.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserData(
        id: data?['id'],
        name: data?['name'],
        email: data?['email'],
        photoUrl: data?['photourl'],
        location: data?['location'],
        fcmToken: data?['fcmtoken'],
        addTiem: data?['addtime']);
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photoUrl != null) "photourl": photoUrl,
      if (location != null) "location": location,
      if (fcmToken != null) "fcmtoken": fcmToken,
      if (addTiem != null) "addtime": addTiem
    };
  }
}

class UserLoginResponseEntity {
  String? accessToken;
  String? disPlayName;
  String? email;
  String? photoUrl;

  UserLoginResponseEntity(
      {this.accessToken, this.disPlayName, this.email, this.photoUrl});

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
          accessToken: json["access_token"],
          disPlayName: json["display_name"],
          email: json["email"],
          photoUrl: json[""]);
  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": disPlayName,
        "email": email,
        "photoUrl": photoUrl
      };
}
