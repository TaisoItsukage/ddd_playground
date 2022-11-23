// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'value/current_stock.dart';
import 'value/future_stock.dart';
import 'value/item_id.dart';

class Item extends Equatable {
  const Item({
    required this.id,
    required this.name,
    required this.currentStock,
    required this.futureStock,
  });
  final ItemId id;
  final String name;
  final CurrentStock currentStock;
  final FutureStock futureStock;
  //操作対象となるデータをもつクラスの中に、データ操作のメソッドを書く！

  //商品名は変更可能とする
  Item changeName(Item item, String newName) {
    return copyWith(name: newName);
  }

  @override
  List<Object> get props => [id, name, currentStock, futureStock];

  Item copyWith({
    ItemId? id,
    String? name,
    CurrentStock? currentStock,
    FutureStock? futureStock,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      currentStock: currentStock ?? this.currentStock,
      futureStock: futureStock ?? this.futureStock,
    );
  }
}

//Listは外部からaddや値の変更をされるとバグのもとになる。
//→コレクションオブジェクト(ファーストクラスコレクション)を作成
class ItemList {
  //_itemListを操作する権限があるのは、ItemListクラスのみ。
  //ほかのファイルからは参照できないようにする
  ItemList(this._itemList);
  final List<Item> _itemList;

  ItemList add(Item item) => ItemList([..._itemList, item]);

  ItemList remove(ItemId id) => ItemList(
        [
          for (final item in _itemList)
            if (item.id != id) item,
        ],
      );
  ItemList changeName(ItemId id, String newName) => ItemList(
        [
          for (final item in _itemList)
            if (item.id == id) item.changeName(item, newName) else item,
        ],
      );

  int length() => _itemList.length;

  //unmodifiableなListにして返却する。
  List<Item> asList() => List<Item>.unmodifiable(_itemList);
}

//stateProviderでダメな理由は、stateProviderだとメソッドの定義ができないから。
//list<entity>の場合は、UIを再描画させるために以下のクラスを作成する必要あり。
class ItemListObjectNotifier extends StateNotifier<ItemList> {
  ItemListObjectNotifier() : super(ItemList([]));

  ItemList addItem(Item item) => state = state.add(item);

  ItemList removeItem(ItemId id) => state = state.remove(id);

  ItemList changeItemName(ItemId id, String newName) =>
      state = state.changeName(id, newName);
}

final itemListObjectProvider =
    StateNotifierProvider<ItemListObjectNotifier, ItemList>(
  (ref) => ItemListObjectNotifier(),
);
