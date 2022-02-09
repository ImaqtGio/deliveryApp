import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';
import 'package:myapp/src/cubits/profiles/cubit.dart';
import 'package:myapp/src/designSystem/button.dart';
import 'package:myapp/src/models/profile.dart';
import 'package:myapp/src/pages/profile/edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<ProfilesCubit>(context)
          .fetch('giordano.delogu@ied.edu'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if ((snapshot.data as List<ProfileObject>).isEmpty) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            final list = snapshot.data as List<ProfileObject>;
            final data = list[0];
            return Scaffold(
              body: SafeArea(
                minimum: const EdgeInsets.all(48),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(data.image != ''
                                ? data.image
                                : 'https://source.unsplash.com/random/'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          data.firstName != '' ? data.firstName : 'Andrea?',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          data.lastName != ''
                              ? data.lastName
                              : 'compila i campi',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(
                                  image: data.image,
                                  firstName: data.firstName,
                                  lastName: data.lastName,
                                  email: data.email,
                                ),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(24),
                            child: CButton(
                              icon: Icons.edit,
                              label: 'Edit account',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).logout();
                        },
                        child: const CButton(
                          label: 'LogOut',
                          icon: Icons.logout,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
