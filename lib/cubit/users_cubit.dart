import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  fetchUsers() async {
    try {
      emit(UsersLoading());
      Dio dio = Dio();
      final res = await dio.get(
        "https://jsonplaceholder.typicode.com/users",
      );
      if (res.statusCode == 200) {
        final users = res.data.map<User>((user) {
          return User.fromJson(user);
        }).toList();

        emit(UsersSucces(users: users));
      }else{
        emit(UsersError(errorMessage: "Error loading users: ${res.data.toString()}"),);
      }
    } catch (e) {
      emit(UsersError(errorMessage: e.toString()),);
    }
  }
}
