import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/services/todo.dart';

import 'bloc/todos_bloc.dart';

class TodoList extends StatelessWidget {
  final String username;

  const TodoList({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: BlocProvider(
        create: (context) =>
            TodosBloc(RepositoryProvider.of<TodoService>(context))
              ..add(LoadTodo(username)),
        child: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is TodoLoaded) {
              return ListView(
                  children: state.tasks
                      .map((e) => ListTile(
                            title: Text(e.task),
                            trailing: Checkbox(
                              value: e.completed,
                              onChanged: (val) {},
                            ),
                          ))
                      .toList());
            }
            return Container();
          },
        ),
      ),
    );
  }
}
