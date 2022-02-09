import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';
import 'package:myapp/src/designSystem/loading.dart';
import 'package:myapp/src/pages/login/login.dart';
import 'package:myapp/src/pages/tab/tab.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
        '/tab-bar': (context) => const TabBarPage(),
      },

      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state == AuthState.logged) {
            return const TabBarPage();
          } else if (state == AuthState.unlogged) {
            return const Login();
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
