import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthState {
  logged,
  unlogged,
  loading,
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.unlogged);

  void login() => emit(AuthState.logged);
  void signup(String email, String password) async {
    emit(AuthState.loading);
    final response = await
    Supabase.instance.client.auth.signUp(email, password);
    if (response.error != null){
      print(response.error?.message);
      emit(AuthState.unlogged);
    } else {
      print(response.data?.user?.email);
      emit(AuthState.logged);
    }
  }
  void logout() async {
    final response = await
    Supabase.instance.client.auth.signOut();
    if (response.error != null){
      print(response.error?.message);
      emit(AuthState.logged);
    } else {
      print(response);
      emit(AuthState.unlogged);
    }
  }
}