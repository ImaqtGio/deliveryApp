import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorieBtn extends StatelessWidget {
  const CategorieBtn({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0XFFffbe0b),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(image),
              )),
            )
          ],
        ),
      ),
    );
  }
}
