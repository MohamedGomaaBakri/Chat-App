// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:chat_app/Pages/Cubits/Regester_Cubit/regester_cubit.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/widgets/TextFields.dart';
import 'package:chat_app/widgets/default_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: use_key_in_widget_constructors
class RegesterScreen extends StatelessWidget {
  String? Email;
  static String id = 'RegesterScreen';

  String? Password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegesterCubit, RegesterState>(
      listener: (context, state) {
        if (state is RegesterLoading) {
          isLoading = true;
        } else if (state is RegesterSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is RegesterFailure) {
          ShowSnackBar(context, state.errormsg);
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
                          'Regester',
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
                      HintText: 'Email',
                      onChanged: (data) {
                        Email = data;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text_Feild(
                      obsecure: true,
                      HintText: 'Password',
                      onChanged: (data) {
                        Password = data;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    defaultButton(
                      ButtonName: 'SIGN UP',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegesterCubit>(context)
                              .regesterUser(Email: Email!, Password: Password!);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ?',
                          style: TextStyle(
                            color: Color(0xff92A9BF),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '  Login',
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

  void ShowSnackBar(BuildContext context, String messege) {
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
}
