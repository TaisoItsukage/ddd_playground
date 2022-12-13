import 'package:ddd_playground/domain/user/i_user.dart';
import 'package:ddd_playground/util/provider/firebase_auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fireUserProvider = StreamProvider<FirebaseUser?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges().map(
        (user) =>
            user != null ? FirebaseUser._(user.uid, user.getIdToken) : null,
      ),
);

class FirebaseUser extends IUser {
  FirebaseUser._(super.id, this.getIdToken);
  final Future<String> Function([bool]) getIdToken;

  @override
  Future<UserRole> fetchUserRole() async {
    final idToken = await getIdToken();
    return UserRole.values.from(idToken);
  }
}

extension EnumsX<T extends Enum> on List<T> {
  T from(String value) => firstWhere(
        (e) => '$e'.split('.').last == value,
        orElse: () => throw AssertionError('Enum "$T.$value is not found"'),
      );
}
