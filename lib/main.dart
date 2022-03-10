import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_bloc/services/auth.dart';
import 'package:todo_with_bloc/services/todo.dart';

import 'home/homepage.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthServices()),
        RepositoryProvider(create: (context) => TodoService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
