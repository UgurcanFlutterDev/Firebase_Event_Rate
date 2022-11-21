import 'package:hive/hive.dart';
part "user_model.g.dart";

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String? displayName;
  @HiveField(1)
  String? email;
  @HiveField(2)
  bool? emailVerified;
  @HiveField(3)
  bool? isAnonymous;
  @HiveField(4)
  String? phoneNumber;
  @HiveField(5)
  String? photoUrl;
  @HiveField(6)
  String? refreshToken;
  @HiveField(7)
  String? tenantId;
  @HiveField(8)
  String? uid;

  User({
    this.displayName,
    this.email,
    this.emailVerified,
    this.isAnonymous,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
    this.tenantId,
    this.uid,
  });

  User.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    isAnonymous = json['isAnonymous'];
    phoneNumber = json['phoneNumber'];
    photoUrl = json['photoUrl'];
    refreshToken = json['refreshToken'];
    tenantId = json['tenantId'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['isAnonymous'] = isAnonymous;
    data['phoneNumber'] = phoneNumber;
    data['photoUrl'] = photoUrl;
    data['refreshToken'] = refreshToken;
    data['tenantId'] = tenantId;
    data['uid'] = uid;
    return data;
  }
}
