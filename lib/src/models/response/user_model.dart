import 'package:flutter_fire_starter/src/models/base_model.dart';

class UserModel extends BaseModel
{
  final String username;
  final String? pseudo;
  final String? password;
  final String? repassword;
  final String? phone;
  final String? createdDate;
  final String? code;
  final bool? enabled;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;
  //final String? accessToken;

  const UserModel({
    id = 0,
    createdAt = 0,
    updatedAt = 0,
    deletedAt = 0,
    required this.username,
    this.password,
    this.phone,
    this.pseudo,
    this.repassword,
    this.accountNonExpired,
    this.accountNonLocked,
    this.code,
    this.createdDate,
    this.credentialsNonExpired,
    this.enabled,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt, deletedAt: deletedAt);

  @override
  List<Object?> get props =>
  [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    username,
    password,
    phone,
    pseudo,
    repassword,
    accountNonExpired,
    accountNonLocked,
    code,
    createdDate,
    credentialsNonExpired,
    enabled,
  ];

  factory UserModel.fromMap(Map<String, dynamic> map)
  {
    return UserModel(
      id: map['id'] ?? 0,
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      deletedAt: map['deletedAt'] ?? 0,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? '',
      pseudo: map['pseudo'] ?? '',
      repassword: map['repassword'] ?? '',
      accountNonExpired: map['accountNonExpired'] ?? true,
      accountNonLocked: map['accountNonLocked'] ?? true,
      code: map['code'] ?? '',
      createdDate: map['createdDate'] ?? '',
      credentialsNonExpired: map['credentialsNonExpired'] ?? true,
      enabled: map['enabled'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'username': username,
    'password': password,
    'phone': phone,
    'pseudo': pseudo,
    'repassword': repassword,
    'accountNonExpired': accountNonExpired,
    'accountNonLocked': accountNonLocked,
    'code': code,
    'createdDate': createdDate,
    'credentialsNonExpired': credentialsNonExpired,
    'enabled': enabled,
  };
}