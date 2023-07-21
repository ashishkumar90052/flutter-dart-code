import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class NeoPops extends StatelessWidget {
  const NeoPops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neo Pop Buttons')),
      body: ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [
          const Text('NeoPop Button'),
          h16,
          NeoPopButton(
            color: kGreen,
            onTapUp: () => HapticFeedback.vibrate(),
            onTapDown: () => HapticFeedback.vibrate(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pay now"),
                ],
              ),
            ),
          ),
          h24,
          const Text('NeoPop Button'),
          h16,
          NeoPopButton(
            color: kGreen,
            buttonPosition: Position.center,
            onTapUp: () {},
            border: const Border.fromBorderSide(
              BorderSide(color: kGreen, width: 2),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pay Now", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          h24,
          const Text('NeoPop Button'),
          h16,
          NeoPopButton(
            color: kBlack,
            bottomShadowColor: kGreen,
            rightShadowColor: kGreen,
            animationDuration: const Duration(microseconds: 5000),
            depth: 2,
            onTapUp: () {},
            border: Border.all(
              color: kGreen,
              width: 1,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Scan & Pay", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          h24,
          const Text('NeoPop Button'),
          h16,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: NeoPopButton(
                  color: kGreen,
                  buttonPosition: Position.fullBottom,
                  depth: 10,
                  onTapUp: () {},
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                      child: Text("Button"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: NeoPopButton(
                  color: kBlack,
                  bottomShadowColor: kGreen,
                  rightShadowColor: kGreen,
                  buttonPosition: Position.fullBottom,
                  depth: 2,
                  onTapUp: () {},
                  border: Border.all(
                    color: kGreen,
                    width: 1,
                  ),
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                      child: Text(
                        "Button",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
