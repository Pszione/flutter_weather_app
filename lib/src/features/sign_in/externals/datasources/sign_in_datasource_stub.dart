import '../../../features.dart';

class SignInDatasourceStub implements ISignInDatasource {
  @override
  Future<String> signInWithEmailAndPassword(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 2));
    assert(data['email'].isNotEmpty && data['password'].isNotEmpty);
    return 'id';
  }

  @override
  Future<void> resetPassword(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 2));
    assert(data['email'].isNotEmpty);
    return;
  }

  @override
  Future<String?> signInWithSocial(socialMedia) async {
    await Future.delayed(const Duration(seconds: 2));
    // TODO: implement signInWithSocial
    throw UnimplementedError();
  }
}
