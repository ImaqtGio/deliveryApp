import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/counter.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  /*if (state < 5){
                    return Text('ciao');
                  }
                  else if (state >= 5 && state < 10){
                    return Text('continuando');
                  }
                  else if (state >= 10){
                    return Text('finito');                 //giacomo vaffanculooooo
                  }*/
                  return Text(
                    '$state',
                    style: TextStyle(
                      fontSize: state.toDouble() + 12,
                      color: Colors.pink,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Container(
                  height: 56,
                  width: 311,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Center(
                    child: Text(
                      'press to add',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}