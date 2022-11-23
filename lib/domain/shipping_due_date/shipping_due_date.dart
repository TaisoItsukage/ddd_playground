import 'package:equatable/equatable.dart';

//期日の業務ルールを扱うクラス
class ShippingDueDate extends Equatable {
  const ShippingDueDate({
    required this.dueDate,
  });
  final DateTime dueDate;

  bool isExpired() {
    //期限切れか
    return DateTime.now().isBefore(dueDate);
  }

  bool isExpiredOn(DateTime date) {
    //その日は期限切れか
    return date.isBefore(dueDate);
  }

  int remainingDays() {
    //期限までの残日数
    return DateTime.now().difference(dueDate).inDays;
  }

  // AlertType alertPriority() {}

  @override
  List<Object> get props => [dueDate];
}
