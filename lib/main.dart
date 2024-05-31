// ignore_for_file: camel_case_types

import 'package:chat_app/Pages/Cubits/Chat_Cubit/chat_cubit.dart';
import 'package:chat_app/Pages/Cubits/Regester_Cubit/regester_cubit.dart';
import 'package:chat_app/Pages/Cubits/login_Cubit/login_cubit.dart';
import 'package:chat_app/Pages/Login_Screen.dart';
import 'package:chat_app/Pages/Regester_Screen.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat_app());
}

class chat_app extends StatelessWidget {
  const chat_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegesterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          RegesterScreen.id: (context) => RegesterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ChatPage.id: (context) => ChatPage(),
        },
        home: LoginScreen(),
      ),
    );
  }
}
