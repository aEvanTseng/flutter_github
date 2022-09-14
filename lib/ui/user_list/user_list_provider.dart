import 'package:flutter_github/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/user.dart';
import '../../data/repository/user_repository.dart';

class UserListProvider extends StateNotifier<AsyncValue<UserList>> {
  UserListProvider(this._userRepository) : super(const AsyncValue.loading()) {
    getUsers();
  }

  final UserRepository _userRepository;

  Future<void> getUsers() async {
    try {
      state = const AsyncValue.loading();

      final userList = await _userRepository.getUsers();

      state = AsyncValue.data(userList);
    } catch (e) {
      const AsyncValue.error('Some error occurred');
    }
  }
}

final userListProvider =
    StateNotifierProvider.autoDispose<UserListProvider, AsyncValue<UserList>>(
        (ref) {
  return UserListProvider(ref.watch(userRepositoryProvider));
});
