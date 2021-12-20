import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/feed/cubit.dart';
import 'package:myapp/src/designSystem/post.dart';
import 'package:myapp/src/models/post.dart';
import 'package:myapp/src/pages/shop/shop.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BlocProvider.of<FeedCubit>(context).fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if ((snapshot.data as List<PostObject>).isEmpty) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              final list = snapshot.data as List<PostObject>;
              return ListView(
                children: list
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopPage(
                                id: e.id,
                                title: e.title,
                                imageUrl: e.image,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0XFFffbe0b),
                          ),
                          child: SinglePost(
                            image: e.image,
                            title: e.title,
                            likes: e.likes.toString(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
