abstract class ISignUpDatasource {
  Future<String> signUpWithEmailAndPassword(Map<String, dynamic> data);
}
