import 'package:bloc/bloc.dart';
import 'package:recipe/pages/cookBook.dart';

import '../../model/GetDescription.dart';
import '../../model/firebasecollection.dart';

class UseridCubit extends Cubit<Stream<Currentuserid>?> {
  final String _fd;
  UseridCubit(String fid)
      : _fd = fid,
        super(DatabaseService(fid: fid)
            .currentID); //In the constructor of a Dart class, the colon : is used to initialize fields before the constructor body is executed.

  void changeid(int newid) async {
 
    await DatabaseService(fid: _fd).updateid(newid);
    emit(DatabaseService(fid: _fd).currentID);
  }

}



