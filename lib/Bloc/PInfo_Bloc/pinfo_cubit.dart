import 'package:bloc/bloc.dart';
import '../../model/firebasecollection.dart';

class PinfoCubit extends Cubit<Stream<Currentpinfo>?> {
  final String _fd;
  PinfoCubit(String fid)
      : _fd = fid,
        super(DatabaseService(fid: fid)
            .current_pinfo); //In the constructor of a Dart class, the colon : is used to initialize fields before the constructor body is executed.

  void changename(String newname) async {
    await DatabaseService(fid: _fd).updatepersonalinfo(newname);
    emit(DatabaseService(fid: _fd).current_pinfo);
  }

}



