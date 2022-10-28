import 'package:ddd_playground/util/provider/firebase_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstDummyPage extends ConsumerWidget {
  const FirstDummyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => ref.read(firebaseAuthProvider).signOut(),
            child: const Text('signOut'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/a/next'),
            child: const Text('next'),
          ),
          const Text('1'),
        ],
      ),
    );
  }
}
