class SignInEntity {
  final String email;
  final String password;
  SignInEntity({
    required this.email,
    required this.password,
  });

  factory SignInEntity.empty() {
    return SignInEntity(email: '', password: '');
  }

  SignInEntity copyWith({
    String? email,
    String? password,
  }) {
    return SignInEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
