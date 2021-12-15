import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/designSystem/button.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF222222),
              ),
              cursorColor: Colors.white,
              style: const TextStyle(),
              onChanged: (String text) {
                email = text;
              },
              onSubmitted: (String text) {},
              obscureText: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF222222),
              ),
              cursorColor: Colors.white,
              style: const TextStyle(),
              onChanged: (String text) {},
              onSubmitted: (String text) {
                password = text;
              },
              obscureText: true,
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).signup(email, password);
            },
            child: const CButton(
              icon: Icons.login,
              label: 'Sign In',
            ),
          ),
        ],
      ),
    );
  }
}
