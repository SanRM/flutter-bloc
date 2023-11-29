
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameCubit extends Cubit<String> {

  UsernameCubit(): super('no-username') {
    print('UsernameCubit - constructor');
  }

  void changeUsername(String username) => emit(username); 

}