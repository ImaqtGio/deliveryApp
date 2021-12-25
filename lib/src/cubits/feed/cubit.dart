import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/models/post.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthState {
  logged,
  unlogged,
  loading,
}

class FeedCubit extends Cubit<AuthState> {
  FeedCubit() : super(AuthState.unlogged);

  Future<List<PostObject>> fetch() async {
    final response = await Supabase.instance.client.from('feed').select('''
      id,
      image,
      title,
      likes
    ''').execute();
    if (response.error != null){
      return <PostObject>[];
    } else {
      final list = response.data as List<dynamic>? ?? <dynamic>[];
      final post = <PostObject>[];
      for (final e in list){
        post.add(PostObject.fromJson(e));
      }
      return post;
    }
  }
}