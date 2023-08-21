import 'package:flutter/material.dart';
import 'package:flutterdartcode/getx/new_page.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';
import 'package:get/get.dart';

class GSnackBar extends StatelessWidget {
  const GSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text('Change theme')),
              TextButton(
                  onPressed: () {
                    Get.snackbar(
                      "SnackBar",
                      "Hello everyone",
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Text('Show snackbar')),
              h16,
              TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        titlePadding: const EdgeInsets.all(32),
                        title: 'Confirmation',
                        content: const Text(
                            'Are you Sure you want to approve this user'),
                        textCancel: 'Cancel',
                        onConfirm: () => Get.back(),
                        textConfirm: 'Approve');
                  },
                  child: const Text('Show dialog')),
            ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          style: FilledButton.styleFrom(
              shape: shape8, minimumSize: const Size(double.infinity, 48)),
          onPressed: () => Get.to(() => const NewPage()),
          child: const Text('Go to Next Page'),
        ),
      ),
    );
  }
}
