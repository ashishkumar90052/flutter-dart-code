import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: <Widget>[
          const SliverAppBar.medium(title: Text('Home')),
          SliverToBoxAdapter(
            child: Container(
              color: kRed,
              height: 1200,
            ),
          )
        ],
      ),
    );
  }
}
