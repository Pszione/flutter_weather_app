import '../../../features.dart';

class SignUpDatasourceStub implements ISignUpDatasource {
  @override
  Future<String> signUpWithEmailAndPassword(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 2));
    assert(data['email'].isNotEmpty && data['password'].isNotEmpty);
    return 'id';
  }
}
