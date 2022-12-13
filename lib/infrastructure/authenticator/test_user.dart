import 'package:ddd_playground/domain/user/i_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final testUserProvider =
    StreamProvider<TestUser?>((ref) => Stream.value(TestUser._('testUserID')));

class TestUser extends IUser {
  TestUser._(super.id);

  @override
  Future<UserRole> fetchUserRole() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    const idToken = 'admin';
    return UserRole.values.from(idToken);
  }
}

extension EnumsX<T extends Enum> on List<T> {
  T from(String value) => firstWhere(
        (e) => '$e'.split('.').last == value,
        orElse: () => throw AssertionError('Enum "$T.$value is not found"'),
      );
}
