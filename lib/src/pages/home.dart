import 'package:flutter/material.dart';
import 'package:myapp/src/designSystem/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CButton(
          label: 'ciao',
          icon: Icons.laptop_mac,
        ),
      ),
    );
  }
}
