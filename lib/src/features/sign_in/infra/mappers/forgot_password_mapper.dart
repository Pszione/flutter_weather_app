import 'dart:convert';

import '../../../features.dart';

class ForgotPasswordMapper {
  const ForgotPasswordMapper._();
  static Map<String, dynamic> toMap(ForgotPasswordEntity entity) =>
      <String, dynamic>{
        'email': entity.email.toLowerCase().trim(),
      };

  static ForgotPasswordEntity fromMap(Map<String, dynamic> map) =>
      ForgotPasswordEntity(
        email: map['email'] as String,
      );

  static String toJson(ForgotPasswordEntity entity) =>
      json.encode(toMap(entity));

  static ForgotPasswordEntity fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
