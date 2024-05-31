import 'package:chat_app/models/messegeModel.dart';
import 'package:flutter/material.dart';

class BubleMessege extends StatelessWidget {
  const BubleMessege({super.key, required this.messege});
  final messegeModel messege;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          decoration: const BoxDecoration(
            color: Color(0xff274561),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Text(
            messege.messege,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BubleMessegeForAnotherAccount extends StatelessWidget {
  const BubleMessegeForAnotherAccount({super.key, required this.messege});
  final messegeModel messege;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          decoration: const BoxDecoration(
            color: Color(0xff006488),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Text(
            messege.messege,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
