import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/cubits/feed/cubit.dart';
import 'package:myapp/src/cubits/shop/cubit.dart';
import 'package:myapp/src/designSystem/categories.dart';
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
      body: ListView(
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
                for (var i = 0; i < 8; i++) const CategorieBtn(),
              ],
            ),
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
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                    name: e.name,
                                    description: e.description,
                                    price: e.price,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.network(e.image),
                                Text(e.name),
                                Text(e.price.toString()),
                                Text(e.description),
                              ],
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
        ],
      ),
    );
  }
}
