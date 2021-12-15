import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';
import 'package:myapp/src/pages/authentication/login.dart';
import 'package:myapp/src/pages/counter/counter.dart';
import 'package:myapp/src/pages/feed/feed.dart';
import 'package:myapp/src/pages/home.dart';
import 'package:myapp/src/pages/profile/profile.dart';
import 'package:myapp/src/pages/shop/shop.dart';
import 'package:myapp/src/pages/state/state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state == AuthState.logged){
            return const Feed();
          }
          else if (state == AuthState.unlogged) {
            return const Feed();
          }
          else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
