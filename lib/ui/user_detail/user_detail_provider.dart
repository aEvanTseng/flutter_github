import 'package:flutter_github/data/model/user.dart';
import 'package:flutter_github/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailProvider extends StateNotifier<AsyncValue<UserDetail>> {
  UserDetailProvider(this._userRepository, {required String name})
      : super(const AsyncValue.loading()) {
    getUser(name);
  }

  final UserRepository _userRepository;

  Future<void> getUser(String name) async {
    try {
      state = const AsyncValue.loading();

      final userDetail = await _userRepository.getUser(name);

      state = AsyncValue.data(userDetail);
    } catch (e) {
      const AsyncValue.error('Some error occurred');
    }
  }
}

final userDetailProvider = StateNotifierProvider.autoDispose
    .family<UserDetailProvider, AsyncValue<UserDetail>, String>((ref, name) {
  return UserDetailProvider(ref.watch(userRepositoryProvider), name: name);
});
