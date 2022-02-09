import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/pages/feed/feed.dart';
import 'package:myapp/src/pages/profile/profile.dart';
import 'package:myapp/src/pages/state/state.dart';
import 'package:myapp/src/cubits/pages/cubit.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewCubit(),
      child: BlocBuilder<ViewCubit, PageState>(
        builder: (context, state) {
          return DefaultTabController(
            initialIndex: (() {
              switch (state){
                case PageState.profile:
                  return 0;
                case PageState.feed:
                  return 1;
                case PageState.order:
                  return 2;
              }
            }()),
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                bottom: TabBar(
                  labelColor: const Color(0XFFffbe0b),
                  indicatorColor: const Color(0XFFffbe0b),
                  tabs: [
                    const Tab(
                      icon: Icon(Icons.account_circle),
                    ),
                    const Tab(
                      icon: Icon(Icons.feed),
                    ),
                    Tab(
                      icon: Image.asset(
                        "images/logo_yellow.png",
                        width: 24,
                      ),
                    ),
                  ],
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "images/logo_yellow.png",
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Glovo",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  Profile(),
                  Feed(),
                  OrderPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
