import 'package:hooks_riverpod/hooks_riverpod.dart';

//インフラ層の何らかのインスタンスをここに入れる。
final iUserProvider = Provider((ref) {});

abstract class IUser {
  const IUser(this.id);
  final String id;
  Future<UserRole> fetchUserRole();
}

enum UserRole { admin, endUser, seller }

//singinとかsignoutのテストをどうするか悩む。。
//mock化が必須の部分とそうでない部分に分かれる？
//
//