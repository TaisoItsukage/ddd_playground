// ./User.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_customer_data_id.freezed.dart';

// モデル定義
@freezed
class PublicCustomerDataId with _$PublicCustomerDataId {
  const factory PublicCustomerDataId({required String id}) =
      _PublicCustomerDataId;
}
