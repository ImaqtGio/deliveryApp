import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  const SinglePost({
    Key? key,
    required this.title,
    required this.image,
    required this.likes,
  }) : super(key: key);

  final String likes;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      width: double.maxFinite,
      height: 400,
      decoration: BoxDecoration(
        /*borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),*/
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 400,
          height: 100,
          margin: const EdgeInsets.only(
            top: 250,
          ),
          decoration: BoxDecoration(
            color: const Color(0XFFffbe0b),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/33/33249.png",
                                ),
                              ),
                            ),
                          ),
                          Text(likes),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
