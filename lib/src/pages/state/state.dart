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
              final state = el['state'] as int;
              switch (state){
                case 0:
                  return const FlowOrderTop(text: 'Ordine accettato', state: 0,);
                case 1:
                  return const FlowOrderTop(text: "Ritirando l'ordine", state: 1,);
                case 2:
                  return const FlowOrderTop(text: "Consegnando l'ordine", state: 2,);
                default:
                  return const FlowOrderTop(text: "nessun ordine", state: 3,);
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