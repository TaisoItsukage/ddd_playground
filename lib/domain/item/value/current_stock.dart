import 'package:equatable/equatable.dart';

class CurrentStock extends Equatable {
  const CurrentStock({
    required this.amount,
  });
  final int amount;

  @override
  List<Object> get props => [amount];

  @override
  bool get stringify => true;
}
