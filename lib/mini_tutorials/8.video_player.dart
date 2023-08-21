// import 'package:floating/floating.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// class PIP extends StatefulWidget {
//   const PIP({super.key});

//   @override
//   PIPState createState() => PIPState();
// }

// class PIPState extends State<PIP> with WidgetsBindingObserver {
//   // final floating = Floating();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     floating.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.inactive) {
//       floating.enable();
//     }
//   }

//   Future<void> enablePip() async {
//     final status = await floating.enable();
//     debugPrint('PiP enabled? $status');
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Floating Example App'),
//           ),
//           body: Center(
//             child: PiPSwitcher(
//               childWhenDisabled: const Text('disabled'),
//               childWhenEnabled: const Text('enabled'),
//             ),
//           ),
//           floatingActionButton: FutureBuilder<bool>(
//             future: floating.isPipAvailable,
//             initialData: false,
//             builder: (context, snapshot) {
//               final isPipAvailable = snapshot.data ?? false;
//               return isPipAvailable
//                   ? PiPSwitcher(
//                       childWhenDisabled: FloatingActionButton.extended(
//                         onPressed: enablePip,
//                         label: const Text('Enable PiP'),
//                         icon: const Icon(Icons.picture_in_picture),
//                       ),
//                       childWhenEnabled: const SizedBox(),
//                     )
//                   : const Card(
//                       child: Text('PiP Unavailable'),
//                     );
//             },
//           ),
//         ),
//       );
// }
