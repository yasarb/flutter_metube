import 'package:metube/model/user_model.dart';
import 'package:metube/repository/user_db.dart';

class UserRepository {
  static final UserRepository _repo = new UserRepository._internal();

  UserDatabase database;

  static UserRepository get() {
    return _repo;
  }

  UserRepository._internal() {
    database = UserDatabase.get();
  }

  Future addUser(User user) async {
    return database.insert(user);
  }

  Future getUser(int id) async {
    return database.getUser(id);
  }

  Future<List<User>> getAllUsers() async {
    return await database.getUsers([]);
  }

  Future getUsers(List<int> ids) async {
    return database.getUsers(ids);
  }

  Future updateBook(User user) async {
    database.updateUser(user);
  }
}
