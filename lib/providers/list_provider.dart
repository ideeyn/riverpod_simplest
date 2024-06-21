import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_simplest/dummy.dart';
import 'package:riverpod_simplest/model.dart';

// STEP 1
// class ListNotifier extends StateNotifier<List<DataModel>> {
//   ListNotifier() : super([]); // used [] because the type is "list"
// }
// final listProvider = StateNotifierProvider<ListNotifier, List<DataModel>>(
//   (ref) => ListNotifier(),
// );

/// STEP 2 -- create fuctions to edit state from outside
class ListNotifier extends StateNotifier<List<DataModel>> {
  ListNotifier() : super(dummyData);

  updateQuantity(DataModel item, int change) {
    // must use "=" assign statement, not .replace .add or .remove etc
    state = [
      for (final data in state)
        // but when we re-asign same key that already declared before
        // it just re-write the data, not creating new. so kinda like replacing
        if (data.name == item.name)
          DataModel(
            name: data.name,
            desc: data.desc,
            category: data.category,
            quantity: data.quantity + change,
          )
        else
          data,
    ];
  }
}

final listProvider = StateNotifierProvider<ListNotifier, List<DataModel>>(
  (ref) => ListNotifier(),
);
