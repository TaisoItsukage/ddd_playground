import 'package:ddd_playground/util/exception/exception.dart';
import 'package:equatable/equatable.dart';

class Amount extends Equatable {
  const Amount({required this.amount});
  final int amount;

  List<Object?> get props => throw UnimplementedError();
}
