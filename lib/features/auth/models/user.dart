import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class Users {
  String? uid;
  String? email;
  String? name;
  List? cartId;

  Users({this.uid, this.email, this.name,this.cartId});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

}