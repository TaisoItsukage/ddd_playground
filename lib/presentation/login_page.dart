import 'package:ddd_playground/infrastructure/authenticator/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authErrorMessageProvider = StateProvider((ref) => "");

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = ref.watch(authErrorMessageProvider);
    final authenticator = ref.watch(authenticatorProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              child: const Text('signIn'),
              onPressed: () {
                authenticator.signInWithEmail(
                    "taiso.itsukage@gmail.com", "12345");
              },
            ),
            Text("error: $errorMessage")
          ],
        ));
  }
}
