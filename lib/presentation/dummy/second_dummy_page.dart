import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/item/item.dart';

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
                  itemListObject.length().toString(),
                  DateTime.now().toString(),
                ),
              ),
          child: const Text('新規作成'),
        ),
      ],
    );
  }
}
