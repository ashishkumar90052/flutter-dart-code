import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

import '../utils/const.dart';

class Car extends StatelessWidget {
  const Car({super.key});

  @override
  Widget build(BuildContext context) {
   
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          border: Border(bottom: BorderSide(color: colorLearn)),
          middle: Text('Financial Services')),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24.0),
                    const Text('2019 430i Convertable', style: title),
                    h8,
                    const Text(
                      'Loose account | 01234567890',
                      style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.w400),
                    ),
                    Image.network(
                      'https://images.summitmedia-digital.com/topgear/images/2023/01/23/bmw-ix3-m-sport-2023-main-1674481797.jpg',
                      height: 150,
                    ),
                    h16,
                    const Text(
                      'Amount Due: \$234567890',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    h8,
                    Container(
                      decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey5,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsetsDirectional.all(4),
                      child: const Text(
                        'Due on Apr 24, 2021',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    h24,
                    const CupertinoListTile(
                      title: Text('Total Monthly Payment', style: title),
                      subtitle: Text('\$5000', style: subTitle),
                    ),
                    const Divider(),
                    const CupertinoListTile(
                      title: Text('Previous Payment', style: title),
                      subtitle: Text('\$500 on Feb 24, 2021', style: subTitle),
                    ),
                    const Divider(),
                    CupertinoListTile(
                      title: const Text('Pending', style: title),
                      subtitle: const Text('\$500 scheduled on Jul 24, 2021',
                          style: subTitle),
                      additionalInfo: CupertinoButton(
                          child: const Text(
                            'EDIT',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {}),
                    ),
                    const Divider(),
                    CupertinoListTile(
                      title: const Text('EasyPay', style: title),
                      subtitle: const Text('Automatic Recurring Payments',
                          style: subTitle),
                      additionalInfo: CupertinoButton(
                          child: const Text(
                            'EDIT',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {}),
                    ),
                    const Divider(),
                    const CupertinoListTile(
                        title:
                            Text('Secure Paperless Statement', style: title)),
                    const Divider(),
                    const CupertinoListTile(
                      title: Text('Statements', style: title),
                      additionalInfo: CupertinoListTileChevron(),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
              child: CupertinoButton(
                  color: CupertinoColors.black,
                  child: const Text('MAKE A PAYMENT'),
                  onPressed: () {}),
            ),
            CupertinoButton(
                child: const Text(
                  'ACCOUNT INFO',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
