import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_simplest/providers/list_provider.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  // liat ni bersih ngga usah ambil data dari params, langsung aja ke riverpod

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(listProvider);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text('data dari riverpod'),
          const SizedBox(height: 20),
          for (var data in dataList)
            ListTile(
              title: Text(data.name),
              subtitle: Text(data.desc),
              trailing: Text(data.quantity.toString()),
            ),
        ],
      ),
    );
  }
}
