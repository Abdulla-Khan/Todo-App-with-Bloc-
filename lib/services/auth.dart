import 'package:hive/hive.dart';
import 'package:todo_with_bloc/model/user.dart';

class AuthServices {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');

    _users.add(User('testUser', 'password'));
    _users.add(User('abd', '123'));
  }

  Future<String?> authUser(final String username, final String password) async {
    final sucess = await _users.values.any((element) =>
        element.username == username && element.password == password);
    if (sucess) {
      return username;
    } else {
      return null;
    }
  }
}
