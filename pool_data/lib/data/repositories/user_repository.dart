import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/domain/repositories/user_repository.dart';
import 'package:pool_data/request.dart';

class DataUserRepository implements UserRepository {
  List<User> userList = [];
  @override
  Future<void> getUsers() async {
    Request.getUsers(userList);
  }
}
