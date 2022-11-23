import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  const CartItem({
    required this.amount,
    required this.price,
  });
  final int amount;
  final int price;
  @override
  List<Object> get props => [amount, price];

  CartItem copyWith({
    int? amount,
    int? price,
  }) {
    return CartItem(
      amount: amount ?? this.amount,
      price: price ?? this.price,
    );
  }

  @override
  bool get stringify => true;
}
