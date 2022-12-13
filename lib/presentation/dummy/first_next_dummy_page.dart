import 'package:ddd_playground/infrastructure/authenticator/auth_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstNextDummyPage extends ConsumerWidget {
  const FirstNextDummyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedInUser = ref.watch(isSignedInProvider);
    return isSignedInUser.when(
      data: (data) => const Text('signedIn'),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const CircularProgressIndicator.adaptive(),
    );
  }
}
