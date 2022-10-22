//プロフィール画像や名前など、公開しても問題ないユーザの情報
import 'package:ddd_playground/domain/public_customer_data/value/public_customer_data_id.dart';

class PublicCustomerData {
  PublicCustomerData(this.publicCustomerDataId);
  final PublicCustomerDataId publicCustomerDataId;
}
