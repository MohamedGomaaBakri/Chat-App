import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LOginUser(
      {required String Email, required String Password}) async {
    // ignore: unused_local_variable
    try {
      emit(LoginLoading());
      // ignore: unused_local_variable
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(errorMsg: 'SomeThiing went Wrong'));
    }
  }
}
