import '../../../../imports.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource authDatasource;
  const AuthRepository(this.authDatasource);

  @override
  bool isLogged() {
    return authDatasource.isLoggedIn();
  }

  @override
  String getUserId() {
    return authDatasource.getUserId();
  }

  @override
  String getToken() {
    return authDatasource.getToken();
  }

  @override
  Future<void> logout() async {
    await authDatasource.logout();
  }
}
