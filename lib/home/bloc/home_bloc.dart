import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_with_bloc/services/auth.dart';
import 'package:todo_with_bloc/services/todo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthServices _auth;
  final TodoService _todo;

  HomeBloc(this._auth, this._todo) : super(RegisteringState()) {
    on<Login>((event, emit) async {
      final user = _auth.authUser(event.username, event.password);
      if (user != null) {
        emit(SucessLogin(user as String));
        emit(HomeInitial());
      }
    });

    on<RegisteringEvent>(((event, emitter) async {
      await _auth.init();
      await _todo.init();
      emit(HomeInitial());
    }));
  }
}
