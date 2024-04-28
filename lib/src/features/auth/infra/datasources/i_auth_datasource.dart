abstract class IAuthDatasource {
  bool isLoggedIn();
  String getUserId();
  String getToken();

  Future<void> logout();
}
