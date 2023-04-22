import 'package:bloc/bloc.dart';
import 'package:recipe/pages/cookBook.dart';

import '../../model/GetDescription.dart';
import '../../model/firebasecollection.dart';

class CookBookCubit extends Cubit<Stream<Currentbook>?> {
  final String _fd;
  CookBookCubit(String fid)
      : _fd = fid,
        super(DatabaseService(fid: fid)
            .currentbook); //In the constructor of a Dart class, the colon : is used to initialize fields before the constructor body is executed.

  void updateBook(Description addToBook, List currentbook) async {
    final currentList = currentbook;
    final List newList;

    bool isMapInList = List<Map<String, dynamic>>.from(currentList)
        .any((map) => map["RecipeId"] == addToBook.toMap()["RecipeId"]);

    if (isMapInList) {
      print("Recipe is already stored in CookBook");
      
      newList = currentList;
    } else {
      print('lol');
      newList = List<Map<String, dynamic>>.from(currentList)
        ..add(addToBook.toMap());
    }
    await DatabaseService(fid: _fd).updatecookbook(newList);
    emit(DatabaseService(fid: _fd).currentbook);
  }

  void removeFrmBook(int index, List currentbook) async {
    final currentList = currentbook;
    final newList = List<Map>.from(currentList)..removeAt(index);
    await DatabaseService(fid: _fd).updatecookbook(newList);
    emit(DatabaseService(fid: _fd).currentbook);
  }
}




// class RecipeCubit extends Cubit<List<Description>> {
//   RecipeCubit() : super([]);

//   void add(Description addToBook) {
//     final currentList = state;
//     final newList = List<Description>.from(currentList)..add(addToBook);
//     return emit(newList);
//   }

//   List getstate() {
//     final currentList = state;
//     final newList = List<Description>.from(currentList);
//     print('newList');
//     return newList;
//   }

//   void remove(int index) {
//     final currentList = state;
//     final newList = List<Description>.from(currentList)..removeAt(index);
//     return emit(newList);
//   }
// }