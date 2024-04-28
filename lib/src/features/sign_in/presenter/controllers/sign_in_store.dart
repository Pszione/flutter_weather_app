import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../features.dart';

part 'sign_in_store.g.dart';

// ignore: library_private_types_in_public_api
class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  final SignInRepository _repository;

  _SignInStore(this._repository);

  @observable
  String error = '';

  @computed
  bool get canLogin => error.isEmpty;

  @observable
  SignInEntity value = SignInEntity.empty();

  @action
  void setValue(SignInEntity value) => this.value = value;

  @observable
  ObservableFuture<String> observableSignInCall = ObservableFuture.value('');

  @computed
  bool get isLoading => observableSignInCall.status == FutureStatus.pending;

  Future onSignIn() async {
    try {
      observableSignInCall = ObservableFuture(_signInCall(value));

      final result = await observableSignInCall;
      if (result.isEmpty) {
        error = 'Something went wrong';
        return;
      }
    } catch (e) {
      log(e.toString());
      error = e.toString();
    }
    // if (canLogin) {
    //   result.fold(
    //     (failure) => error = failure,
    //     (user) {
    //       // Do something with the user
    //     },
    //   );
  }

  Future<String> _signInCall(SignInEntity entity) async {
    return await _repository.signInWithEmailAndPassword(entity);
  }
}
