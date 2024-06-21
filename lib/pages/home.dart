import 'package:flutter/material.dart';
import 'package:riverpod_simplest/pages/admin.dart';
import 'package:riverpod_simplest/pages/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // see here is really clean. we dont have any method or pass it.
  // we can even keep this as stateless

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AdminScreen()));
            },
            child: const Text('admin')),
        const Row(),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserScreen()));
            },
            child: const Text('user'))
      ],
    ));
  }
}
