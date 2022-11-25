import 'package:ddd_playground/domain/item/value/amount.dart';
import 'package:equatable/equatable.dart';

class FutureStock extends Equatable {
  const FutureStock({
    required this.expectedDate,
    required this.amount,
  });
  final DateTime expectedDate;
  final Amount amount;

  @override
  List<Object> get props => [expectedDate, amount];
}
