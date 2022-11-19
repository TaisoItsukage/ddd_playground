import 'package:equatable/equatable.dart';

class ItemId extends Equatable {
  const ItemId({
    required this.itemId,
  });
  final String itemId;

  @override
  List<Object> get props => [itemId];

  @override
  bool get stringify => true;
}
