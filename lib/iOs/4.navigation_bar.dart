import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';
import '../utils/const.dart';

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.bars),
            largeTitle: Text('Flutter dart code'),
            trailing: Icon(CupertinoIcons.person_crop_circle),
          ),
          SliverFillRemaining(
              child: ListView.separated(
            shrinkWrap: true,
            itemCount: dataList.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) =>
                const Divider(indent: 60, color: kWhite),
            itemBuilder: (BuildContext context, int index) {
              return CupertinoListTile(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute<Widget>(
                    builder: (BuildContext context) => const NextPage(),
                  ),
                ),
                leading: Image.network(dataList[index]['img']),
                title: Text(dataList[index]['title'], style: title),
                subtitle: Text(dataList[index]['post'] ?? '', style: subTitle),
                trailing: Text(dataList[index]['time'], style: trailing),
              );
            },
          ))
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
              middle: Text('Follow Me on'), largeTitle: Text('Instagram')),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Drag me up', textAlign: TextAlign.center),
                Text('Tap on the leading button to navigate back'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
