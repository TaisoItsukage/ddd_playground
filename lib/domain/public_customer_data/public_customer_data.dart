//プロフィール画像や名前など、公開しても問題ないユーザの情報エンティティ
import 'package:ddd_playground/util/value/user_id/user_id.dart';

class PublicCustomerData {
  PublicCustomerData(this.userId);
  final UserId userId;
}
