part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}
final class UsersLoading extends UsersState {}
final class UsersError extends UsersState {
  String errorMessage;
  UsersError({required this.errorMessage});
}
final class UsersSucces extends UsersState {
  List<User>users;
  UsersSucces({required this.users});
}
