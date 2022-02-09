
import 'package:flutter_bloc/flutter_bloc.dart';


class TotalPriceCubit extends Cubit<double> {
  TotalPriceCubit() : super(0);
  
  void increment(double price) {
    emit(state + price);
  } 
  void decrement(double price) {
    emit(state - price);
  }
}