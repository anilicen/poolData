import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/domain/repositories/user_repository.dart';
import 'package:pool_data/request.dart';

class DataUserRepository implements UserRepository {
  static final _instance = DataUserRepository._internal();
  DataUserRepository._internal();
  factory DataUserRepository() => _instance;

  List<User> userList = [];

  List<User> getUserList() {
    return userList;
  }

  @override
  Future<void> getUsers() async {
    await Request.getUsers(userList);
  }

  @override
  Future<void> updateUser(String id, int matchWon, int matchLost, int rackWon, int rackLost) async {
    await Request.updateUser(id, matchWon, matchLost, rackWon, rackLost);
  }

  @override
  Future<void> addUser(Map<String, dynamic> json) async {
    await Request.addUser(json);
  }
}
