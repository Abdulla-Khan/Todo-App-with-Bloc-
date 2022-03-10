import 'package:hive/hive.dart';
import 'package:todo_with_bloc/model/task.dart';

class TodoService {
  late Box<Task> _task;
  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _task = await Hive.openBox<Task>('tasks');
    await _task.add(Task('testUser', "Let's Go", true));
    await _task.add(Task('abd', "Let's Go Abdullah", false));
  }

  List<Task> getTask(final String username) {
    final tasks = _task.values.where((element) => element.user == username);
    return tasks.toList();
  }

  void addTask(final String task, final String username) {
    _task.add(Task(username, task, false));
  }

  void removeTask(final String task, final String username) async {
    final taskRemove = _task.values.firstWhere(
        (element) => element.task == task && element.user == username);
    await taskRemove.delete();
  }

  Future<void> updateTask(final String task, final String username,
      {final bool? completed}) async {
    final taskEdit = _task.values.firstWhere(
        (element) => element.task == task && element.user == username);
    final index = taskEdit.key as int;
    await _task.put(
        index, Task(username, task, completed ?? taskEdit.completed));
  }
}
