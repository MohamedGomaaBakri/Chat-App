// ignore_for_file: must_be_immutable

import 'package:chat_app/Pages/Cubits/Chat_Cubit/chat_cubit.dart';
import 'package:chat_app/models/messegeModel.dart';
import 'package:chat_app/widgets/Buble_Messege.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'Chat Page';

  TextEditingController sendcontroller = TextEditingController();
  final controller = ScrollController();
  List<messegeModel> messegesList = [];

  @override
  Widget build(BuildContext context) {
    var Email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff274561),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 70,
            ),
            const Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messegesList = state.Messeges;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: controller,
                  itemCount: messegesList.length,
                  itemBuilder: (context, index) {
                    return messegesList[index].id == Email
                        ? BubleMessege(
                            messege: messegesList[index],
                          )
                        : BubleMessegeForAnotherAccount(
                            messege: messegesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: sendcontroller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sendmsg(messege: value, Email: Email!);
                sendcontroller.clear();
                controller.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Messege',
                suffixIcon: const Icon(
                  Icons.send,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xff274561),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
