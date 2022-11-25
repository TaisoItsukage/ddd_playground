import 'package:ddd_playground/domain/item/value/amount.dart';
import 'package:equatable/equatable.dart';

class CurrentStock extends Equatable {
  const CurrentStock({
    required this.amount,
  });
  final Amount amount;

  @override
  List<Object> get props => [amount];

  @override
  bool get stringify => true;
}
