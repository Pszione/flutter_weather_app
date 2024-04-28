import '../../sign_in.dart';

abstract class ISignInRepository {
  Future<String> signInWithEmailAndPassword(SignInEntity signInEntity);
  Future<String?> signInWithSocial(dynamic socialMedia);
  Future<void> resetPassword(ForgotPasswordEntity forgotEntity);
}
