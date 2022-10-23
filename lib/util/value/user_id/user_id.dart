import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_id.freezed.dart';

// モデル定義
@freezed
class UserId with _$UserId {
  @Assert('id.isNotEmpty')
  factory UserId({required String id}) = _UserId;
}
