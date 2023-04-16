import 'package:bloc/bloc.dart';

class RecipeObserver extends BlocObserver {
  const RecipeObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    print('${bloc.runtimeType} $change');
  }
}
