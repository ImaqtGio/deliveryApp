import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/models/categories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class CategoriesCubit extends Cubit {
  CategoriesCubit() : super(dynamic);

  Future<List<CategorieObject>> fetch() async {
    final response = await Supabase.instance.client.from('categories').select('''
      id,
      name,
      image
    ''').execute();
    if (response.error != null){
      return <CategorieObject>[];
    } else {
      final list = response.data as List<dynamic>? ?? <dynamic>[];
      final post = <CategorieObject>[];
      for (final e in list){
        post.add(CategorieObject.fromJson(e));
      }
      return post;
    }
  }
}