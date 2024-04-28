abstract class ISignInDatasource {
  Future<String> signInWithEmailAndPassword(Map<String, dynamic> data);
  Future<String?> signInWithSocial(dynamic socialMedia);
  Future<void> resetPassword(Map<String, dynamic> data);
}
