import 'package:login_ui/data/validate.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _email = BehaviorSubject<String>();
  final _pass = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(emailValid);
  Stream<String> get pass => _pass.stream.transform(passValid);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, pass, (e, p) => true);
  Function(String) get emailOn => _email.sink.add;
  Function(String) get passOn => _pass.sink.add;
  submit() {
    final emailV = _email.value;
    final passV = _pass.value;
    print('your email $emailV');
    print('Your pass is $passV');
  }
}

final bloc = Bloc();
