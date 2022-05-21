import 'package:flutter_fire_starter/src/models/base_model.dart';

class LoginUserRequestModel extends BaseModel
{
  final String? username;
  final String? pseudo;
  final String password;
  final String? repassword;
  final String phone;

  const LoginUserRequestModel({
    id = 0,
    createdAt = 0,
    updatedAt = 0,
    deletedAt = 0,
    this.username,
    required this.password,
    required this.phone,
    this.pseudo,
    this.repassword,
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
  ];

  factory LoginUserRequestModel.fromMap(Map<String, dynamic> map)
  {
    return LoginUserRequestModel(
      id: map['id'] ?? 0,
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      deletedAt: map['deletedAt'] ?? 0,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? '',
      pseudo: map['pseudo'] ?? '',
      repassword: map['repassword'] ?? '',
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
  };
}