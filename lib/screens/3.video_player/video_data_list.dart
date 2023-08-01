// import 'package:flutter/material.dart';
// import 'package:flutterdartcode/screens/3.video_player/video_player.dart';
// import 'package:flutterdartcode/utils/size_cofig.dart';
// import 'package:flutterdartcode/utils/videos_list.dart';

// class VideoList extends StatefulWidget {
//   const VideoList({super.key});

//   @override
//   State<VideoList> createState() => _VideoListState();
// }

// class _VideoListState extends State<VideoList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(elevation: 5, title: const Text("Videos List")),
//       body: ListView.builder(
//         itemCount: videoList.length,
//         itemBuilder: (BuildContext context, int index) {
//           var data = videoList[index];
//           return Card(
//             surfaceTintColor: kWhite,
//             color: kWhite,
//             child: ListTile(
//               leading: SizedBox(
//                   width: 90,
//                   child: Image.network(
//                     data['thumbnailUrl'],
//                     fit: BoxFit.cover,
//                   )),
//               title: Text(data['title']),
//               subtitle: Text(
//                 data['description'],
//                 maxLines: 2,
//               ),
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           BetterPlayerUI(url: data['videoUrl']))),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
