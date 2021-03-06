import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_with_bloc/services/todo.dart';

import '../../model/task.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoService _todoService;
  TodosBloc(this._todoService) : super(TodosInitial()) {
    on<LoadTodo>((event, emit) {
      final todos = _todoService.getTask(event.username);
      emit(TodoLoaded(todos));
    });
  }
}
