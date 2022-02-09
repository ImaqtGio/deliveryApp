import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';
import 'package:myapp/src/cubits/categories/cubit.dart';
import 'package:myapp/src/cubits/feed/cubit.dart';
import 'package:myapp/src/cubits/pages/cubit.dart';
import 'package:myapp/src/cubits/profiles/cubit.dart';
import 'package:myapp/src/cubits/shop/cubit.dart';
import 'package:myapp/src/cubits/totalprice/cubit.dart';
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
      create: (context) => ViewCubit(),
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocProvider(
          create: (context) => FeedCubit(),
          child: BlocProvider(
            create: (context) => ShopCubit(),
            child: BlocProvider(
              create: (context) => CategoriesCubit(),
              child: BlocProvider(
                create: (context) => TotalPriceCubit(),
                child: BlocProvider(
                  create: (context) => ProfilesCubit(),
                  child: const App(),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
