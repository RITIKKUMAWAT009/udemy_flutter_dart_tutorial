import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_bloc/src/blocs/validator.dart';

class Bloc with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  Function(String) get emailChanged => _email.sink.add;
  Function(String) get passwordChanged => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('email is $validEmail  and password is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

// final bloc = Bloc();
