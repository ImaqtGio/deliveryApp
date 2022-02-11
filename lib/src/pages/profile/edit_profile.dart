import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/cubits/pages/cubit.dart';
import 'package:myapp/src/designSystem/button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfile extends StatefulWidget{
  const EditProfile(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.image,
      required this.email})
      : super(key: key);

  final String firstName;
  final String lastName;
  final String image;
  final String email;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String newfirstName;
  late String newlastName;
  late String newimage;
  late String newemail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0XFFffbe0b),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(48),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 56),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: widget.firstName,
                      labelText: "Nome",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
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
                      newfirstName = text;

                    },
                    onSubmitted: (String text) {
                      newfirstName = text;
                    },
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 56),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: widget.lastName,
                      labelText: "Cognome",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
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
                      newlastName = text;
                    },
                    onSubmitted: (String text) {
                      newlastName = text;
                    },
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 56),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: widget.image,
                      labelText: "Url immagine",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
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
                      newimage = text;
                    },
                    onSubmitted: (String text) {
                      newimage = text;
                    },
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: GestureDetector(
                    onTap: () {
                      if(newfirstName == ''){
                        newfirstName = widget.firstName;
                      }
                      if(newlastName == ''){
                        newlastName = widget.lastName;
                      }
                      if(newimage == ''){
                        newimage = widget.image;
                      }
                      Supabase.instance.client
                          .from('users')
                          .update({
                            'first_name': widget.firstName,
                            'last_name': widget.lastName,
                            'image': widget.image,
                          })
                          .eq('email', widget.email)
                          .execute();
                      BlocProvider.of<ViewCubit>(context).profile();
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    },
                    child: const CButton(
                      icon: Icons.save,
                      label: 'Save',
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
        ),
      ),
    );
  }
}
