import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';
import 'package:myapp/src/cubits/feed/cubit.dart';
import 'package:myapp/src/cubits/shop/cubit.dart';
import 'package:myapp/src/pages/feed/feed.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Supabase.initialize(
      url: 'https://lgspmtundeniiddjgvfv.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNjEwNTg0NCwiZXhwIjoxOTUxNjgxODQ0fQ.JgCcFEzSxQY116oOlsAaDDzOp6iKN4U_RCid0toxFX8',
      authCallbackUrlHostname: 'login-callback', // optional
      debug: true // optional
      );
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocProvider(
        create: (context) => FeedCubit(),
        child: BlocProvider(
          create: (context) => ShopCubit(),
          child: const App(),
        ),
      ),
    ),
  );
}
