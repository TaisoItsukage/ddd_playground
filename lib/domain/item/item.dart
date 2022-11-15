import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Item extends Equatable {
  const Item(this.id, this.name);
  final String id;
  final String name;

  //操作対象となるデータをもつクラスの中に、データ操作のメソッドを書く！

  //商品名は変更可能とする
  Item changeName(Item item, String newName) {
    return Item(id, newName);
  }

  @override
  List<Object?> get props => [id, name];
}

//Listは外部からaddや値の変更をされるとバグのもとになる。
//→コレクションオブジェクト(ファーストクラスコレクション)を作成
class ItemList {
  //_itemListを操作する権限があるのは、ItemListクラスのみ。
  //ほかのファイルからは参照できないようにする
  ItemList(this._itemList);
  final List<Item> _itemList;

  ItemList addItem(Item item) {
    return ItemList([..._itemList, item]);
  }

  ItemList removeItem(String id) {
    return ItemList([
      for (final item in _itemList)
        if (item.id != id) item,
    ]);
  }

  ItemList changeItemName(String id, String newName) {
    return ItemList([
      for (final item in _itemList)
        if (item.id == id) item.changeName(item, newName) else item,
    ]);
  }

  //unmodifiableなListにして返却する。
  List<Item> getItemList() {
    return List<Item>.unmodifiable(_itemList);
  }
}

//stateProviderでダメな理由は、stateProviderだとメソッドの定義ができないから。
//List<エンティティ>の場合は、UIを再描画させるために以下のクラスを作成する。
class ItemListObjectNotifier extends StateNotifier<ItemList> {
  ItemListObjectNotifier() : super(ItemList([]));

  ItemList addItem(Item item) {
    return state = state.addItem(item);
  }

  ItemList removeItem(String id) {
    return state = state.removeItem(id);
  }

  ItemList changeItemName(String id, String newName) {
    return state = state.changeItemName(id, newName);
  }
}

final itemListObjectProvider =
    StateNotifierProvider<ItemListObjectNotifier, ItemList>((ref) {
  return ItemListObjectNotifier();
});
