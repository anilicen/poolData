import 'package:pool_data/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> getUsers();
  Future<void> updateUser(String id, int matchWon, int matchLost, int rackWon, int rackLost);
  List<User> getUserList();
  Future<void> addUser(Map<String, dynamic> json);
}
