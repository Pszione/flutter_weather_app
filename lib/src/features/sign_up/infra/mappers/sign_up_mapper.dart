import 'dart:convert';

import '../../../../imports.dart';

class SignUpEntityMapper {
  static Map<String, dynamic> toMap(SignUpEntity entity) {
    return <String, dynamic>{
      'name': entity.name.trim(),
      if (entity.phone != null)
        'phone': entity.phone!.trim().replaceAll(' ', '').replaceAll('-', ''),
      'email': entity.email.trim().toLowerCase(),
      'password': entity.password.trim(),
    };
  }

  static Map<String, dynamic> toMapPhoneAndName(SignUpEntity entity) {
    return toMap(entity)
      ..removeWhere(
          (key, value) => value == null || (key != 'phone' && key != 'name'));
  }

  static SignUpEntity fromMap(Map<String, dynamic> map) {
    return SignUpEntity(
      name: map['name'] as String,
      phone: map['phone'] as String?,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  static String toJson(SignUpEntity entity) => json.encode(toMap(entity));

  static SignUpEntity fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
