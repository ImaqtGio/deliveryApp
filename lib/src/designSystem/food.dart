import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/designSystem/food_counter.dart';

class SingleFood extends StatelessWidget {
  const SingleFood({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String name;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0XFFffbe0b),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      price.toString() + " €",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const FoodCounter(),
          ],
        ),
      ),
    );
  }
}
