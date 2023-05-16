import 'package:bloc/bloc.dart';
import 'package:recipe/model/Storagemodel.dart';

import '../../authentication/authenticationServices.dart';
import '../../model/GetDescription.dart';
import '../../model/firebasecollection.dart';

class FireidCubit extends Cubit<Stream<Userid?>?> {
  FireidCubit() : super(
            // AuthService().user 
            null
            ); //null iif not working

  final AuthService _auth = AuthService();
  void login(String email, String password) async {
    await _auth.signIn(email, password);
    return emit(_auth.user);
  }

  void register(String email, String password, String id,String name) async {
    await _auth.regwithEandP(email, password, id,name);
    return emit(_auth.user);
  }

  void forgotpw(String email) async {
    await _auth.resetPassword(email);
  }

  void logout() async {
    return emit(await _auth.signout());
  }
}
