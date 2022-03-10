part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class LoadTodo extends TodosEvent {
  final String username;

  LoadTodo(this.username);

  @override
  List<Object> get props => [];
}
