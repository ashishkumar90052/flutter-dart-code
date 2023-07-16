import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';
import 'package:scratcher/widgets.dart';

class ScratchCard extends StatefulWidget {
  const ScratchCard({super.key});

  @override
  State<ScratchCard> createState() => _ScratchCardState();
}

class _ScratchCardState extends State<ScratchCard> {
  void _bottom() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 350,
            child: Column(
              children: [
                h24,
                Container(
                  width: 100,
                  height: 4.0,
                  decoration: const BoxDecoration(color: kBlack12),
                ),
                h24,
                const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.inc42.com/wp-content/uploads/2022/11/zomato-ft-760x570.png'),
                    ),
                    title: Text(
                      'Earn upto 500',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,\n\nwhen an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                        ),
                        h16,
                      ],
                    ),
                  ),
                ),
                FilledButton(
                  style:
                      FilledButton.styleFrom(minimumSize: const Size(380, 50)),
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scratch Card')),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.zero,
              color: kGreen,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          clipBehavior: Clip.antiAlias,
                          child: Scratcher(
                            brushSize: 30,
                            threshold: 30,
                            color: Colors.green,
                            image: Image.asset('assets/sc.png'),
                            onChange: (value) {
                              if (value >= 70) {
                                _bottom();
                              }
                              debugPrint("Scratch progress: $value%");
                            },
                            onThreshold: () =>
                                debugPrint("Threshold reached, you won!"),
                            child: Container(
                              height: 300,
                              width: 300,
                              color: kWhite,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/congo.png',
                                    height: 100,
                                  ),
                                  const Text(
                                    'You Won',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  h4,
                                  const Text(
                                    '₹ 500',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Center(
                    child: Image.asset('assets/sc.png'),
                  )));
        },
      ),
    );
  }
}
