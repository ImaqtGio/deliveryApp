import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/cubits/feed/cubit.dart';
import 'package:myapp/src/cubits/shop/cubit.dart';
import 'package:myapp/src/designSystem/add_to_cart_btn.dart';
import 'package:myapp/src/designSystem/categories.dart';
import 'package:myapp/src/designSystem/food.dart';
import 'package:myapp/src/designSystem/post.dart';
import 'package:myapp/src/models/product.dart';
import 'package:myapp/src/pages/product/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.id,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                width: double.maxFinite,
                height: 400,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://source.unsplash.com/random",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "subtitle",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 16),
                    for (var i = 0; i < 8; i++) const CategorieBtn(),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FutureBuilder(
                future: BlocProvider.of<ShopCubit>(context).fetch(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if ((snapshot.data as List<ProductObject>).isEmpty) {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    } else {
                      final list = snapshot.data as List<ProductObject>;
                      return Column(
                        children: list
                            .map(
                              (e) => SingleFood(
                                name: e.name,
                                price: e.price,
                                image: e.image,
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
              const SizedBox(
                height: 75,
              )
            ],
          ),
          Positioned(
            width: 500,
            bottom: 16,
            left: 0,
            child: AddToCart(
              totalPrice: 3,
            ),
          ),
        ],
      ),
    );
  }
}
