import 'dart:async';

mixin Validator {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid Email address');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 6) {
        sink.add(password);
      } else {
        sink.addError('Password must be more than 6 characters');
      }
    },
  );
}
