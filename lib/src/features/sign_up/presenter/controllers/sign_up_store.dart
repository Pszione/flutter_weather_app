import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../features.dart';

part 'sign_up_store.g.dart';

// ignore: library_private_types_in_public_api
class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final SignUpRepository _repository;

  _SignUpStore(this._repository);

  @observable
  String error = '';

  @computed
  bool get canLogin => error.isEmpty;

  @observable
  SignUpEntity value = SignUpEntity.empty();

  @action
  void setValue(SignUpEntity value) => this.value = value;

  @observable
  ObservableFuture<String> observableSignUpCall = ObservableFuture.value('');

  @computed
  bool get isLoading => observableSignUpCall.status == FutureStatus.pending;

  Future onSignUp() async {
    try {
      observableSignUpCall = ObservableFuture(_signUpCall(value));

      final result = await observableSignUpCall;
      if (result.isEmpty) {
        error = 'Something went wrong';
        return;
      }
    } catch (e) {
      log(e.toString());
      error = e.toString();
    }
    // if (canSignUp) {
    //   result.fold(
    //     (failure) => error = failure,
    //     (user) {
    //       // Do something with the user
    //     },
    //   );
  }

  Future<String> _signUpCall(SignUpEntity entity) async {
    return await _repository.signUpWithEmailAndPassword(entity);
  }
}
