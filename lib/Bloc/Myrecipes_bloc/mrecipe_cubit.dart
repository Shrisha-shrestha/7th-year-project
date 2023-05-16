import 'package:bloc/bloc.dart';
import 'package:recipe/pages/cookBook.dart';

import '../../model/GetDescription.dart';
import '../../model/firebasecollection.dart';

class MyRecipeCubit extends Cubit<Stream<CurrentMyrecipe>?> {
  final String _fd;
  MyRecipeCubit(String fid)
      : _fd = fid,
        super(DatabaseService(fid: fid)
            .current_mrecipe); //In the constructor of a Dart class, the colon : is used to initialize fields before the constructor body is executed.

  void update(Map addTorecipes, List currentrecipes) async {
   
    final currentList = currentrecipes;
    final List newList;

    newList = currentList..add(addTorecipes);
    print(newList);
    await DatabaseService(fid: _fd).updatemyrecipe(newList);
    emit(DatabaseService(fid: _fd).current_mrecipe);
  }

  void remove(int index, List currentbook) async {
    final currentList = currentbook;
    final newList = List<Map>.from(currentList)..removeAt(index);
    await DatabaseService(fid: _fd).updatemyrecipe(newList);
    emit(DatabaseService(fid: _fd).current_mrecipe);
  }
}
