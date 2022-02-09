import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/models/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class ProfilesCubit extends Cubit {
  ProfilesCubit() : super(dynamic);

  Future<List<ProfileObject>> fetch(String email) async {
    final response = await Supabase.instance.client.from('users').select('''
      id,
      first_name,
      last_name,
      email,
      image
    ''').eq('email', email).execute();
    if (response.error != null){
      return <ProfileObject>[];
    } else {
      final list = response.data as List<dynamic>? ?? <dynamic>[];
      final post = <ProfileObject>[];
      for (final e in list){
        post.add(ProfileObject.fromJson(e));
      }
      return post;
    }
  }
}