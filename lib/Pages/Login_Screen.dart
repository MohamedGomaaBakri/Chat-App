// ignore_for_file: file_names, non_constant_identifier_names

import 'package:chat_app/Pages/Cubits/Chat_Cubit/chat_cubit.dart';
import 'package:chat_app/Pages/Cubits/login_Cubit/login_cubit.dart';
import 'package:chat_app/Pages/Regester_Screen.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/widgets/TextFields.dart';
import 'package:chat_app/widgets/default_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String? Email;
  static String id = 'LoginScreen';

  String? Password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getmsg();
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          ShowSnackBar(context, state.errorMsg);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: const Color(0xff274561),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    const Image(
                      image: AssetImage('assets/images/scholar.png'),
                      height: 100,
                    ),
                    const Center(
                      child: Text(
                        'Scolar Chat',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text_Feild(
                      onChanged: (p0) {
                        Email = p0;
                      },
                      HintText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text_Feild(
                      obsecure: true,
                      onChanged: (p0) {
                        Password = p0;
                      },
                      HintText: 'Password',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    defaultButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .LOginUser(Email: Email!, Password: Password!);
                        }
                      },
                      ButtonName: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                            color: Color(0xff92A9BF),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegesterScreen.id);
                          },
                          child: const Text(
                            '  Sign Up',
                            style: TextStyle(
                              color: Color(0xff92A9BF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

ShowSnackBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        messege,
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}
