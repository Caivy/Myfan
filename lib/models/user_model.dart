

part 'user_model.g.dart';


class UserModel {
  String? phoneNumber;
  String? email;
  String? userId;
  String? displayName;
  String? userName;
  String? profilePic;
  String? contact;
  String? bio;
  String? location;
  String? dob;
  String? createdAt;
  bool? isVerified;
  int? followers;
  int? following;
  String? fcmToken;
  List<String>? followersList;
  List<String>? followingList;

  UserModel({
    this.phoneNumber,
    this.email,
    this.userId,
    this.displayName,
    this.profilePic,
    this.contact,
    this.bio,
    this.dob,
    this.location,
    this.createdAt,
    this.userName,
    this.followers,
    this.following,
    this.isVerified,
    this.fcmToken,
    this.followersList,
  });

  factory UserModel.fromJson(
          Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserModelToJson(this);
}
