// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../util/value/user_id.dart';

class SecretCustomerData extends Equatable {
  final UserId userId;
  const SecretCustomerData({
    required this.userId,
  });

  SecretCustomerData copyWith({
    UserId? userId,
  }) {
    return SecretCustomerData(
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object> get props => [userId];
}
