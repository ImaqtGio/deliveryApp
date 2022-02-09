import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/designSystem/button.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';
import 'package:myapp/src/pages/registration/registration.dart';

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
                onSubmitted: (String text) {
                  password = text;
                  BlocProvider.of<AuthCubit>(context).login(email, password);
                },
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: GestureDetector(
                onTap: () {
                    BlocProvider.of<AuthCubit>(context).login(email, password);
                },
                child: const CButton(
                  icon: Icons.login,
                  label: 'Sign In',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
