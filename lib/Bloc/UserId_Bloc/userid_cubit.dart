import 'package:bloc/bloc.dart';
import 'package:recipe/model/Storagemodel.dart';

import '../../authentication/authenticationServices.dart';
import '../../model/GetDescription.dart';
import '../../model/firebasecollection.dart';

class UseridCubit extends Cubit<Stream<Userid?>?> {
  UseridCubit() : super(null);

  final AuthService _auth = AuthService();
  void login(String email, String password) async {
    await _auth.signIn(email, password);
    return emit(_auth.user);
  }

  void register(String email, String password) async {
    await _auth.regwithEandP(email, password);
    return emit(_auth.user);
  }

  void logout() async {
    return emit(await _auth.signout());
  }
}
