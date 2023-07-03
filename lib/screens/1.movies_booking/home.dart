import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/screens/1.movies_booking/movie_card.dart';
import 'package:flutterdartcode/utils/const.dart';

final List<Widget> imageSliders =
    musicList.map((item) => Container(child: movieCard(item))).toList();

class FullscreenSliderDemo extends StatefulWidget {
  const FullscreenSliderDemo({super.key});

  @override
  FullscreenSliderDemoState createState() => FullscreenSliderDemoState();
}

class FullscreenSliderDemoState extends State<FullscreenSliderDemo> {
  CarouselController buttonCarouselController = CarouselController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: musicList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                      image: NetworkImage(musicList[index]['img']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                );
              },
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              aspectRatio: 2,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                _scrollController.animateTo(
                  ((index.toDouble() * 125 / musicList.length) / 100) *
                      _scrollController.position.maxScrollExtent,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            items: imageSliders,
          ),
        ],
      ),

      // Stack(
      //   children: <Widget>[
      //     Expanded(
      //       child: ListView.builder(
      //           controller: _scrollController,
      //           reverse: true,
      //           scrollDirection: Axis.horizontal,
      //           itemCount: musicList.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                   color: Colors.black12,
      //                   image: DecorationImage(
      //                     image: NetworkImage(musicList[index]['img']),
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //                 child: Container(
      //                   decoration:
      //                       BoxDecoration(color: Colors.black.withOpacity(0.6)),
      //                 ));
      //           }),
      //     ),
      //     CarouselSlider(
      //       options: CarouselOptions(
      //         height: MediaQuery.of(context).size.height,
      //         aspectRatio: 2,
      //         // carouselController: buttonCarouselController,
      //         viewportFraction: 1,
      //         enlargeCenterPage: true,
      //         enableInfiniteScroll: false,
      //         onScrolled: (data) {
      //           _scrollController.animateTo(
      //             ((data! * 125 / imageSliders.length) / 100) *
      //                 _scrollController.position.maxScrollExtent,
      //             // *
      //             // _scrollController.position.maxScrollExtent,
      //             curve: Curves.ease,
      //             duration: const Duration(milliseconds: 500),
      //           );
      //         },
      //       ),
      //       items: imageSliders,
      //     ),
      //   ],
      // ),

      floatingActionButton: ButtonTheme(
        height: 45,
        minWidth: 280,
        child: ElevatedButton(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          // color: Colors.amber[700],
          // textColor: Colors.black,
          onPressed: () {
            debugPrint(_scrollController.position.maxScrollExtent.toString());
          },
          child: Text("Book now".toUpperCase(),
              style: const TextStyle(fontSize: 14)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
