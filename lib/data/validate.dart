import 'dart:async';

class Validator {
  final emailValid =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') && email.contains('.')) {
      sink.add(email);
    } else {
      sink.addError('Invalid email');
    }
  });
  final passValid =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length > 4) {
      sink.add(pass);
    } else {
      sink.addError('Invalid pass');
    }
  });
}
