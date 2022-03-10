part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class Login extends HomeEvent {
  final String username;
  final String password;
  Login(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class RegisteringEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
