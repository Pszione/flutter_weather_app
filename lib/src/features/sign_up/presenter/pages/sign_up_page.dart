import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String name = 'signUp';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  late final store = Provider.of<SignUpStore>(context);
  final _formKey = GlobalKey<FormState>();
  final _autofillGroupKey = GlobalKey<AutofillGroupState>();

  @override
  void initState() {
    super.initState();
    // store.setupValidations();
  }

  @override
  void dispose() {
    // store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: AutofillGroup(
          key: _autofillGroupKey,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) => TextFormField(
                      onChanged: (value) => store.setValue(
                        store.value.copyWith(email: value),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => TextFormField(
                      onChanged: (value) => store.setValue(
                        store.value.copyWith(email: value),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Phone (optional)',
                        hintText: 'Enter your phone number',
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => TextFormField(
                      onChanged: (value) => store.setValue(
                        store.value.copyWith(email: value),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => TextFormField(
                      onChanged: (value) => store.setValue(
                        store.value.copyWith(password: value),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Set a password',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        store.onSignUp();
                      }
                    },
                    child: !store.isLoading
                        ? const Text('Sign up!')
                        : const CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
