import 'dart:convert';

import '../../../../imports.dart';

class SignInEntityMapper {
  static Map<String, dynamic> toMap(SignInEntity entity) => <String, dynamic>{
        'email': entity.email.toLowerCase().trim(),
        'password': entity.password.trim(),
      };

  static SignInEntity fromMap(Map<String, dynamic> map) => SignInEntity(
        email: map['email'] as String,
        password: map['password'] as String,
      );

  static String toJson(SignInEntity entity) => json.encode(toMap(entity));

  static SignInEntity fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
