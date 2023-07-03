import 'package:flutter/material.dart';

Widget movieCard(item) {
  return Column(
    children: <Widget>[
      const SizedBox(
        height: 50,
      ),
      Container(
          height: 300,
          width: 200,
          decoration: const BoxDecoration(),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Image.network(item['img'], fit: BoxFit.cover, width: 1000.0),
          )),
      const SizedBox(
        height: 15,
      ),
      Text(
        item['title'],
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Action ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Icon(
            Icons.brightness_1,
            color: Colors.white,
            size: 4,
          ),
          Text(
            " Advanture",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      const Text(
        "4.0",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star_border,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star_border,
            size: 12,
            color: Colors.white,
          ),
        ],
      )
    ],
  );
}
