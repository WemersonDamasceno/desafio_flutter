import 'dart:async';

import 'package:flutter/material.dart';

class ChristmasBlinkingLights extends StatefulWidget {
  const ChristmasBlinkingLights({super.key});

  @override
  State<ChristmasBlinkingLights> createState() =>
      _ChristmasBlinkingLightsState();
}

class _ChristmasBlinkingLightsState extends State<ChristmasBlinkingLights> {
  late Timer _timer;
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.white];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Start the blinking loop every 400ms
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % colors.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(10, (index) {
        // Each light blinks with a slightly different color and delay
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: colors[(currentIndex + index) % colors.length],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colors[(currentIndex + index) % colors.length]
                    .withOpacity(0.6),
                blurRadius: 6,
                spreadRadius: 1,
              )
            ],
          ),
        );
      }),
    );
  }
}
