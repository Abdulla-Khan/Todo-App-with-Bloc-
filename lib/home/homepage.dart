import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/services/auth.dart';
import 'package:todo_with_bloc/services/todo.dart';
import 'package:todo_with_bloc/todos/todos.dart';

import 'bloc/home_bloc.dart';

class LoginPage extends StatelessWidget {
  final usernameFeild = TextEditingController();
  final passwordFeild = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocProvider(
          create: (context) => HomeBloc(
              RepositoryProvider.of<AuthServices>(context),
              RepositoryProvider.of<TodoService>(context))
            ..add(RegisteringEvent()),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is SucessLogin) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => TodoList(username: state.username)));
              }
            },
            builder: (context, state) {
              if (state is HomeInitial) {
                return Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      controller: usernameFeild,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      controller: passwordFeild,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(
                              Login(usernameFeild.text, passwordFeild.text));
                        },
                        child: Text('Login')),
                  ],
                );
              }
              return Container();
            },
          ),
        ));
  }
}
