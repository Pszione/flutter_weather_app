import '../../sign_in.dart';

abstract class ISignInRepository {
  Future<String> signInWithEmailAndPassword(SignInEntity entity);
  Future<String?> signInWithSocial(dynamic entity);
  Future<void> resetPassword(ForgotPasswordEntity entity);
}
