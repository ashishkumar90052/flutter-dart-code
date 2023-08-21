import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
                leading: const CircleAvatar(),
                title: const Text('Gwangurl'),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('2h', style: style),
                    IconButton(
                        onPressed: () => _bottom(),
                        icon: const Icon(Icons.more_horiz_rounded)),
                  ],
                )),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.repeat)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.share_up))
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _bottom() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  shape: shape20,
                  title: const Text('Mute'),
                  tileColor: kBlack12),
              const ListTile(title: Text('Hide')),
              const ListTile(title: Text('Block')),
              const ListTile(title: Text('Report')),
            ],
          ),
        );
      },
    );
  }
}
