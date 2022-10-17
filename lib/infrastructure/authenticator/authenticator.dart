//認証系の実装はインフラ層で（↓参考）
//https://zenn.dev/dowanna6/articles/5c05ab671fb7ab

import 'package:ddd_playground/util/providers/auth_instance_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/login_page.dart';

final authenticatorProvider = Provider((ref) => Authenticator(ref: ref));

class Authenticator {
  Authenticator({required this.ref});
  //riverpod2.0以降、ReaderではなくRefに。
  final Ref ref;

//UserCredentialをほかの実装で用いない場合は、単にbooleanを返す選択肢もあり？
  Future<UserCredential?> signInWithEmail(String email, String password) async{
    //todo サインイン失敗時のエラーハンドリング
    try {
      return await ref
          .read(authInstanceProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      //エラーハンドリングの参考にしたサイト
      //https://firebase.google.com/docs/auth/flutter/password-auth
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      //todo マジックワードを使わないようにする。
      if (e.code == "weak-password") {
        ref.read(authErrorMessageProvider.notifier).state = "パスワードが簡単すぎます。";
      } else if (e.code == "email-already-in-use") {
        ref.read(authErrorMessageProvider.notifier).state =
            "このアカウントは既に登録されています。";
      } else if(e.code == "wrong-password"){
        ref.read(authErrorMessageProvider.notifier).state = "パスワードが間違えています。";
      }
    } catch (e) {
      ref.read(authErrorMessageProvider.notifier).state = "予期せぬエラーが発生しました";
    }
    return null;
  }

  Future<UserCredential?> signUpWithEmail(String email, String password) async{
    //todo サインアップ失敗時のエラーハンドリング
    return await ref
        .read(authInstanceProvider)
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}