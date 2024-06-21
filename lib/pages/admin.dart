import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_simplest/providers/list_provider.dart';

class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({super.key});

  @override
  ConsumerState<AdminScreen> createState() {
    return _AdminScreenState();
  }
}

class _AdminScreenState extends ConsumerState<AdminScreen> {
  // see even here is clean
  // actually don't need stateful, but this just for example

  @override
  Widget build(BuildContext context) {
    // no need to include widgetref, its included just like context can be
    // called outside build method in normal stateful classes
    final dataList = ref.watch(listProvider);
    // see, the ref already available.
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text('data dari riverpod'),
          const SizedBox(height: 20),
          for (var data in dataList)
            ListTile(
              leading: IconButton(
                onPressed: () {
                  ref.read(listProvider.notifier).updateQuantity(data, -1);
                },
                icon: const Icon(Icons.remove_circle_outline, size: 25),
              ),
              title: Text(data.name),
              subtitle: Text('stock available: ${data.quantity}'),
              trailing: IconButton(
                onPressed: () {
                  ref.read(listProvider.notifier).updateQuantity(data, 1);
                },
                icon: const Icon(Icons.add_circle_outline, size: 25),
              ),
            ),
        ],
      ),
    );
  }
}
