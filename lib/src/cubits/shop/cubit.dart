import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/models/post.dart';
import 'package:myapp/src/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum ShopState {
  loaded,
  loading,
  error,
}

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopState.loading);

  
  Future<List<ProductObject>> fetch(int id) async {
    final response = await Supabase.instance.client.from('products').select('''
      id,
      image,
      name,
      price,
      description
    ''').eq('feed_id', id).execute();
    if (response.error != null){
      return <ProductObject>[];
    } else {
      final list = response.data as List<dynamic>? ?? <dynamic>[];
      final post = <ProductObject>[];
      for (final e in list){
        post.add(ProductObject.fromJson(e));
      }
      return post;
    }
  }
}