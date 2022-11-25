import 'package:ddd_playground/domain/item/value/amount.dart';
import 'package:ddd_playground/domain/item/value/current_stock.dart';
import 'package:ddd_playground/domain/item/value/future_stock.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/item/item.dart';
import '../../domain/item/value/item_id.dart';

class SecondDummyPage extends ConsumerWidget {
  const SecondDummyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListObject = ref.watch(itemListObjectProvider);
    final itemList = itemListObject.asList();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                Text(itemList[index].name),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(itemListObjectProvider.notifier).changeItemName(
                            itemList[index].id,
                            DateTime.now().toString(),
                          ),
                  child: const Text('更新時刻'),
                ),
              ],
            ),
            itemCount: itemListObject.length(),
          ),
        ),
        ElevatedButton(
          onPressed: () => ref.read(itemListObjectProvider.notifier).addItem(
                Item(
                  id: ItemId(itemId: itemListObject.length().toString()),
                  name: DateTime.now().toString(),
                  currentStock: const CurrentStock(amount: Amount(amount: 3)),
                  futureStock: FutureStock(
                    amount: const Amount(amount: 3),
                    expectedDate: DateTime.now(),
                  ),
                ),
              ),
          child: const Text('新規作成'),
        ),
      ],
    );
  }
}
