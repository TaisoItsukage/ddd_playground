//Freezedの癖のある書き方が個人的に苦手
//https://qiita.com/MLLB/items/5350709fd7d794568754

//代わりに、equatableを用いる
//https://kabochapo.hateblo.jp/entry/2021/04/18/175000

//https://little-hands.hatenablog.com/entry/2021/12/13/immutable-entity

// モデル定義
import 'package:ddd_playground/util/exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class UserId extends Equatable {
  UserId(this.userId) {
    if (userId.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.userId, value: userId);
    }
  }
  final String userId;

  @override
  List<Object> get props => [userId];
}
