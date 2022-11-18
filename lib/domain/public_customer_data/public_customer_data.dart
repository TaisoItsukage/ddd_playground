// ignore_for_file: public_member_api_docs, sort_constructors_first
//プロフィール画像や名前など、公開しても問題ないユーザの情報エンティティ
import 'package:equatable/equatable.dart';
import '../../util/value/user_id.dart';

class PublicCustomerData extends Equatable {
  const PublicCustomerData(this.userId);
  final UserId userId;

  @override
  List<Object> get props => [userId];

  @override
  bool get stringify => true;

  PublicCustomerData copyWith({
    UserId? userId,
  }) {
    return PublicCustomerData(
      userId ?? this.userId,
    );
  }
}
