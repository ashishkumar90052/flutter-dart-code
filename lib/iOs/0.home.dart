import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const title = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    const subTitle = TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          border: Border(bottom: BorderSide(color: colorLearn)),
          middle: Text('Car App'),
          trailing: Icon(CupertinoIcons.search)),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            const Text('With Corporate Diffrence', style: title),
            h8,
            const Text(
              'Enjoy the fun driving in Enterprise',
              style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w400),
            ),
            h16,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.0),
              child: CupertinoSearchTextField(),
            ),
            h24,
            const CupertinoListTile(
              title: Text('Top Brands', style: title),
              additionalInfo: Text('View All', style: subTitle),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const Card(
                    child: Text('data'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
