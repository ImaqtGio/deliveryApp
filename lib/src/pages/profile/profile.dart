import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/cubits/Auth/cubit.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.grey,),
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('name'),
                GestureDetector(
                  onTap: (){
                    BlocProvider.of<AuthCubit>(context).logout();
                  },  
                  child: const Icon(
                  Icons.logout,
                  size: 24,
                  color: Colors.black,
                ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.network(
            'https://source.unsplash.com/random',
            width: double.infinity,
            height: 300,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
