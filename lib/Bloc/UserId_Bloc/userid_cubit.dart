import 'package:bloc/bloc.dart';
import 'package:recipe/model/Storagemodel.dart';

import '../../authentication/authenticationServices.dart';
import '../../model/GetDescription.dart';
import '../../model/firebasecollection.dart';

class UseridCubit extends Cubit<Stream<Userid?>>  {
  UseridCubit() : super(AuthService().user);
  @override
  emit(state);
}

class CurrentidCubit extends Cubit<Stream<currentuserid>>  {
  CurrentidCubit() : super(DatabaseService(uid:'1').current);
  void editid(String id) => emit(DatabaseService(uid:id).current);
}
