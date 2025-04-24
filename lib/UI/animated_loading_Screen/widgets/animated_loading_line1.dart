import 'package:flutter/material.dart';

class AnimatedLoadingLine1 extends StatelessWidget {
  const AnimatedLoadingLine1({
    super.key,
    required this.phase,
    required this.animatedDots,
  });

  final int phase;
  final String animatedDots;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    phase == 4
                        ? "Your personalized\n dashboard is ready!"
                        : "We are building your\n dashboard$animatedDots",
                    key: ValueKey(phase),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'PTSerif',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
  }
}