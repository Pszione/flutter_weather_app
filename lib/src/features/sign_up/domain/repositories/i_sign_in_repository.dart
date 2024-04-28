import '../../sign_up.dart';

abstract class ISignUpRepository {
  Future<String> signUpWithEmailAndPassword(SignUpEntity entity);
}
