import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

import '../utils/const.dart';

enum Sky { midnight, viridian, cerulean }

class SegmentedControlExample extends StatefulWidget {
  const SegmentedControlExample({super.key});

  @override
  State<SegmentedControlExample> createState() =>
      _SegmentedControlExampleState();
}

class _SegmentedControlExampleState extends State<SegmentedControlExample> {
  Sky _selectedSegment = Sky.midnight;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: CupertinoSlidingSegmentedControl<Sky>(
            backgroundColor: CupertinoColors.systemGrey2,
            thumbColor: CupertinoColors.systemGrey6,
            groupValue: _selectedSegment,
            onValueChanged: (Sky? value) {
              if (value != null) {
                setState(() {
                  _selectedSegment = value;
                });
              }
            },
            children: const <Sky, Widget>{
              Sky.midnight: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Midnight',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
              Sky.viridian: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Viridian',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
              Sky.cerulean: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Cerulean',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            },
          ),
        ),
        child:
         ListView.separated(
          itemCount: dataList.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              const Divider(indent: 60, color: kWhite),
          itemBuilder: (BuildContext context, int index) {
            return _selectedSegment.name == 'midnight'
                ? CupertinoListTile(
                    leading: Image.network(dataList[index]['img']),
                    title: Text(dataList[index]['title'], style: title),
                    subtitle:
                        Text(dataList[index]['post'] ?? '', style: subTitle),
                    trailing: Text(dataList[index]['time'], style: trailing),
                  )
                : _selectedSegment.name == 'viridian'
                    ? const CupertinoListTile(
                        title: Text('New Payment', style: title),
                        subtitle:
                            Text('\$500 on Feb 24, 2021', style: subTitle),
                      )
                    : const CupertinoListTile(
                        title: Text('old Payment', style: title),
                        subtitle:
                            Text('\$500 on Feb 24, 2021', style: subTitle),
                      );
          },
        ));
  }
}
