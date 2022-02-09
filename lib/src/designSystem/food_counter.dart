import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/totalprice/cubit.dart';

class FoodCounter extends StatefulWidget {
  const FoodCounter({Key? key, required this.price}) : super(key: key);

  final double price;

  @override
  _FoodCounterState createState() => _FoodCounterState();
}

class _FoodCounterState extends State<FoodCounter> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalPriceCubit(),
      child: SizedBox(
        width: 100,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (quantity > 0) {
                    quantity--;
                    BlocProvider.of<TotalPriceCubit>(context)
                        .decrement(widget.price);
                  }
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn0.iconfinder.com/data/icons/typicons-2/24/minus-512.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
              child: Text(quantity.toString(), textAlign: TextAlign.center),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (quantity < 999) {
                    quantity++;
                    BlocProvider.of<TotalPriceCubit>(context)
                        .increment(widget.price);
                  }
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn0.iconfinder.com/data/icons/ui-16px-perfect-megapack-line/16/82_Add-512.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
