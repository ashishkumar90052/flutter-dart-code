import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Text('${index + 1}'),
              title: const Text('How are you'),
              subtitle: Text('${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
