import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/const.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon:
                Badge(label: Text('100+'), child: Icon(Icons.mail_rounded)),
            icon: Badge(label: Text('100+'), child: Icon(Icons.mail_outlined)),
            label: 'Mail',
          ),
          NavigationDestination(
            icon: Badge(
                label: Text('10'), child: Icon(Icons.chat_bubble_outline)),
            selectedIcon: Badge(
                label: Text('10'), child: Icon(Icons.chat_bubble_rounded)),
            label: 'Chat',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.groups_2_rounded),
            icon: Icon(Icons.groups_2_outlined),
            label: 'Rooms',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.videocam_rounded),
            icon: Icon(Icons.videocam_outlined),
            label: 'Meet',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.edit_rounded),
      ),
      appBar: AppBar(
        title: const Text('Badges'),
      ),
      body: <Widget>[
        _home(),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}

Widget _home() {
  return Scaffold(
    body: ListView.separated(
      itemCount: itemg.length,
      separatorBuilder: (context, index) => const Divider(
        indent: 70,
      ),
      itemBuilder: (BuildContext context, int index) {
        var data = itemg[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(musicList[index]['img']),
          ),
          title: Text(data['name']),
          subtitle: Text(data['description']),
          trailing: const Text('5 hr ago'),
        );
      },
    ),
  );
}
