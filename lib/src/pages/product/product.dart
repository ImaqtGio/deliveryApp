import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  final String name;
  final String description;
  final double price;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.name),
          Text(widget.description),
          Text(widget.price.toString()),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text('add'),
              ),
            ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (counter > 0) {
                      counter--;
                    }
                  });
                },
                child: const Text('subtract'),
              ),
            ),
          Text(
            counter.toString(),
          )
        ],
      ),
    );
  }
}
