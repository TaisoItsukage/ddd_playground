//こちらを参考に作成
//https://github.com/altive/flutter_app_template/blob/main/packages/authenticator/lib/src/auth_user_provider.dart
import 'package:ddd_playground/util/provider/firebase_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//AsyncValueでUserをReturnする
final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

final uidProvider = Provider(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);

final isSignedInProvider = FutureProvider(
  (ref) async {
    final user = await ref.watch(authUserProvider.future);
    return user != null;
  },
);
