import 'package:bloc/bloc.dart';

import '../../model/GetDescription.dart';

class RecipeCubit extends Cubit<List<Description>> {
  RecipeCubit() : super([]);

  void add(Description addToBook) {
    final currentList = state;
    final newList = List<Description>.from(currentList)
      ..add(addToBook);
    return emit(newList);
  }

  void remove(int index) {
    final currentList = state;
    final newList = List<Description>.from(currentList)..removeAt(index);
    return emit(newList);
  }
}
