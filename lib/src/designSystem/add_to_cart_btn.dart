import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
   AddToCart({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        width: 400,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://icon-library.com/images/cart-icon-png-white/cart-icon-png-white-16.jpg",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              "Totale: " + totalPrice.toString() + " €",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
