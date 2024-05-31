import 'package:bloc/bloc.dart';
import 'package:chat_app/models/messegeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference Messeges =
      FirebaseFirestore.instance.collection('Messeges');
  void sendmsg({required String messege, required var Email}) {
    try {
      Messeges.add({
        'messege': messege,
        'createdAt': DateTime.now(),
        'id': Email,
      });
// ignore: unused_catch_clause
    } on Exception catch (e) {
      print('there is exeption $e');
    }
  }

  void getmsg() {
    Messeges.orderBy('createdAt', descending: true).snapshots().listen((event) {
      List<messegeModel> messeges = [];

      for (var doc in event.docs) {
        messeges.add(messegeModel.fromJson(doc));
      }
      emit(ChatSuccess(Messeges: messeges));
    });
  }
}
