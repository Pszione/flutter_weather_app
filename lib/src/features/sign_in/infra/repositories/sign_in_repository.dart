import '../../../../imports.dart';

class SignInRepository implements ISignInRepository {
  final ISignInDatasource datasource;
  const SignInRepository(this.datasource);

  @override
  Future<String> signInWithEmailAndPassword(SignInEntity entity) async {
    final data = SignInEntityMapper.toMap(entity);
    return await datasource.signInWithEmailAndPassword(data);
  }

  @override
  Future<String?> signInWithSocial(dynamic entity) async {
    return await datasource.signInWithSocial(entity);
  }

  @override
  Future<void> resetPassword(ForgotPasswordEntity entity) async {
    final data = ForgotPasswordMapper.toMap(entity);
    return await datasource.resetPassword(data);
  }
}
