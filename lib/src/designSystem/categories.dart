import 'package:flutter/material.dart';

class CategorieBtn extends StatelessWidget {
  const CategorieBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0XFFffbe0b),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
  }
}
