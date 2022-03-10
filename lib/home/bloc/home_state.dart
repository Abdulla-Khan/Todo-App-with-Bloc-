part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class SucessLogin extends HomeState {
  final String username;
  const SucessLogin(this.username);
  @override
  List<Object?> get props => [username];
}

class RegisteringState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
