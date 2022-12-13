//こちらを参考に作成
//https://github.com/altive/flutter_app_template/blob/main/packages/authenticator/lib/src/auth_user_provider.dart
import 'package:ddd_playground/domain/user/i_user.dart';
import 'package:ddd_playground/infrastructure/authenticator/test_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//AsyncValueでUserをReturnする
final authUserProvider = StreamProvider<IUser?>(
  (ref) {
    //ここに渡すProviderを差し替えればTestできる。
    return ref.watch(testUserProvider.stream);
  },
);

final uidProvider = Provider(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.id),
);

final isSignedInProvider = FutureProvider(
  (ref) async {
    final user = await ref.watch(authUserProvider.future);
    return user != null;
  },
);

abstract class UserSession {
  const UserSession({
    required this.id,
    required this.role,
  });
  final String id;
  final String role;
}
