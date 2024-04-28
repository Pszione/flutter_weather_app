import '../../../../imports.dart';

class SignUpRepository implements ISignUpRepository {
  final ISignUpDatasource datasource;
  const SignUpRepository(this.datasource);

  @override
  Future<String> signUpWithEmailAndPassword(SignUpEntity entity) async {
    final data = SignUpEntityMapper.toMap(entity);
    return await datasource.signUpWithEmailAndPassword(data);
  }
}
