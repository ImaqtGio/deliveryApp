

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/app.dart';
import 'package:myapp/src/designSystem/button.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = '';
  String password = '';
  bool passwordConfirmed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0XFFffbe0b),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 80,
                top: 80,
              ),
              child: Image.asset(
                'images/logo.png',
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 56),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
                cursorColor: Colors.white,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                onChanged: (String text) {
                  email = text;
                },
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 56),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
                cursorColor: Colors.white,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                onChanged: (String text) {
                  password = text;
                },
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 56),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  labelText: "Confirm password",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
                cursorColor: Colors.white,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                onChanged: (String text) {
                  if (text == password) {
                    setState(() {
                      passwordConfirmed = true;
                    });
                  } else {
                    setState(() {
                      passwordConfirmed = false;
                    });
                  }
                },
                onSubmitted: (String text) {
                  password = text;
                  BlocProvider.of<AuthCubit>(context).signup(email, password);
                },
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: IgnorePointer(
                ignoring: !passwordConfirmed,
                child: Opacity(
                  opacity: passwordConfirmed ? 1 : 0.5,
                  child: GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<AuthCubit>(context).signup(email, password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const App(),
                        ),
                      );
                    },
                    child: const CButton(
                      icon: Icons.login,
                      label: 'Sign Up',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
