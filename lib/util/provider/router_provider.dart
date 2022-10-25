import 'package:ddd_playground/infrastructure/authenticator/auth_user_provider.dart';
import 'package:ddd_playground/presentation/common/nested_bottom_navigation_bar.dart';
import 'package:ddd_playground/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/dummy/first_next_dummy_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final user = ref.watch(authUserProvider);
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => user.when(
            //providerScopeは、アプリのルート以外にも使用可能。
            //例えば、テーマの上書きなどの用途に用いる。
            data: (user) => NestedBottomNavigationBar(tabIndex: 1),
            error: (_, __) => Text(_.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
          routes: [
            GoRoute(
              path: 'tab/:index',
              builder: (context, state) {
                final index = int.parse(state.params['index']!);
                return NestedBottomNavigationBar(tabIndex: index);
              },
              //戻るボタンで、前の画面に戻れるようになる。
              routes: [
                GoRoute(
                  path: 'next',
                  builder: (context, state) => const FirstNextDummyPage(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: 'signin',
          path: '/signin',
          builder: (context, state) => const LoginPage(),
        ),
      ],
      redirect: (context, state) {
        //現在のパスがsignInかどうか。
        final loggingIn = state.subloc == '/signin';
        if (user.value == null) {
          return loggingIn ? null : '/signin';
        }
        if (loggingIn) {
          return '/';
        }
        return null;
      },
    );
  },
);
