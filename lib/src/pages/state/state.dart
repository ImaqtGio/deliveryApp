import 'package:flutter/material.dart';
import 'package:myapp/src/designSystem/flow.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(  
        stream: Supabase.instance.client.from('status').stream().execute(),
        builder: (context,  snapshot){
          if (snapshot.hasData) {
            final list = snapshot.data as List<Map<String, dynamic>>;
            if (list.isNotEmpty){
              final el = list.first;
              print(el);
              final state = el['state'] as int;
              switch (state){
                case 0:
                  return FlowOrderTop(text: 'Ordine accettato', state: 0,);
                case 1:
                  return FlowOrderTop(text: "Ritirando l'ordine", state: 1,);
                default:
                  return FlowOrderTop(text: "Consegnando l'ordine", state: 2,);
              }
            }
            return const SizedBox();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
      ),
    );
  }
}