import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/cubits/pages/cubit.dart';
import 'package:myapp/src/designSystem/button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConfirmedOrder extends StatelessWidget {
  const ConfirmedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: const BoxDecoration(color: Color(0XFFffbe0b)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Acquisto effettuato correttamente',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Supabase.instance.client
                          .from('status')
                          .update({'state': 0})
                          .eq('id', 1)
                          .execute();
                      BlocProvider.of<ViewCubit>(context).feed();
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    },
                    child: const CButton(
                      label: 'Torna alla home',
                      icon: Icons.home,
                    ),
                  ),
                ],
              ),
            ),
      )
      );
  }
}
