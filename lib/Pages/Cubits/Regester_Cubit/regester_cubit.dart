import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());

  Future<void> regesterUser(
      {required String Email, required String Password}) async {
    // ignore: unused_local_variable
    try {
      emit(RegesterLoading());
      // ignore: unused_local_variable
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);
      emit(RegesterSuccess());
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(RegesterFailure(errormsg: 'something went wrong'));
    }
  }
}
