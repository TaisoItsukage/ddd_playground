import 'package:ddd_playground/infrastructure/authenticator/auth_user_provider.dart';
import 'package:ddd_playground/presentation/common/nested_bottom_navigation_bar.dart';
import 'package:ddd_playground/presentation/dummy/first_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/second_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/third_dummy_page.dart';
import 'package:ddd_playground/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../presentation/dummy/first_next_dummy_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    final user = ref.watch(authUserProvider);
    return GoRouter(
      initialLocation: '/a',
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => user.when(
            //providerScopeは、アプリのルート以外にも使用可能。
            //例えば、テーマの上書きなどの用途に用いる。
            data: (user) => NestedBottomNavigationBar(
              child: child,
            ),
            error: (_, __) => Text(_.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
          routes: [
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) {
                return const NoTransitionPage<void>(child: FirstDummyPage());
              },
              //戻るボタンで、前の画面に戻れるようになる。
              routes: [
                GoRoute(
                  path: 'next',
                  builder: (context, state) => const FirstNextDummyPage(),
                ),
              ],
            ),
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) {
                return const NoTransitionPage<void>(child: SecondDummyPage());
              },
              //戻るボタンで、前の画面に戻れるようになる。
              routes: [
                GoRoute(
                  path: 'next',
                  builder: (context, state) => const FirstNextDummyPage(),
                ),
              ],
            ),
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) {
                return const NoTransitionPage<void>(child: ThirdDummyPage());
              },
              //戻るボタンで、前の画面に戻れるようになる。
              routes: [
                GoRoute(
                  path: 'next',
                  builder: (context, state) => const FirstNextDummyPage(),
                ),
              ],
            ),
            GoRoute(
              path: '/d',
              builder: (context, state) {
                return const Text('d');
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
