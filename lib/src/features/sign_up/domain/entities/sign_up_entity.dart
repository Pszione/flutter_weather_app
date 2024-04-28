class SignUpEntity {
  final String name;
  final String? phone;
  final String email;
  final String password;

  SignUpEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory SignUpEntity.empty() {
    return SignUpEntity(
      name: '',
      phone: '',
      email: '',
      password: '',
    );
  }

  SignUpEntity copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
  }) {
    return SignUpEntity(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
