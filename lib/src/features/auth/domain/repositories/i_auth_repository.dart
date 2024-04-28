abstract class IAuthRepository {
  bool isLogged();
  String getUserId();
  String getToken();

  Future<void> logout();
}
