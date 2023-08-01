// // import 'package:better_player/better_player.dart';
// import 'package:flutter/material.dart';

// class BetterPlayerUI extends StatefulWidget {
//   final String url;
//   const BetterPlayerUI({super.key, required this.url});

//   @override
//   State<BetterPlayerUI> createState() => _BetterPlayerUIState();
// }

// class _BetterPlayerUIState extends State<BetterPlayerUI> {
//   BetterPlayerController? _betterPlayerController;

//   @override
//   void initState() {
//     super.initState();
//     BetterPlayerDataSource betterPlayerDataSource =
//         BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.url);
//     _betterPlayerController = BetterPlayerController(
//         const BetterPlayerConfiguration(),
//         betterPlayerDataSource: betterPlayerDataSource);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Video Player')),
//       body: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: BetterPlayer(
//           controller: _betterPlayerController!,
//         ),
//       ),
//     );
//   }
// }
