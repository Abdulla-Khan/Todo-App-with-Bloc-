part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodosState {
  final List<Task> tasks;

  TodoLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}
