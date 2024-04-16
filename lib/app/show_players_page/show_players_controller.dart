import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:pool_data/domain/entities/user.dart';
import 'package:pool_data/domain/repositories/user_repository.dart';

class ShowPlayersController extends Controller {
  ShowPlayersController(UserRepository userRepository) : _userRepository = userRepository;

  UserRepository _userRepository;

  List<User>? userList;

  Future<void> onInitState() async {
    // TODO: implement onInitState
    if (_userRepository.getUserList().isEmpty) {
      await _userRepository.getUsers();
    }
    userList = _userRepository.getUserList();
    refreshUI();
    super.onInitState();
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
