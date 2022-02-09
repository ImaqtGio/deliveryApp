import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlowOrderTop extends StatelessWidget {
  const FlowOrderTop({
    Key? key,
    required this.text,
    required this.state,
  }) : super(key: key);

  final String text;
  final int state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFffbe0b),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  (state == 0) ? "images/accepted.png": (state == 1) ? "images/retire.png": (state == 2) ? "images/delivery.png":"images/logo.png",
                  width: 200,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (state == 0) ? Colors.black: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (state == 1) ? Colors.black: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (state == 2) ? Colors.black: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Text(text, style: GoogleFonts.poppins(),),
          ),
        ],
      ),
    );
  }
}
