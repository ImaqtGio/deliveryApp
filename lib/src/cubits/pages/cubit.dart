
import 'package:flutter_bloc/flutter_bloc.dart';

enum PageState {
  order,
  feed,
  profile
}

class ViewCubit extends Cubit<PageState> {
  ViewCubit() : super(PageState.profile);


  void order() => emit(PageState.order);
  void feed() => emit(PageState.feed);
  void profile() => emit(PageState.profile); 

}