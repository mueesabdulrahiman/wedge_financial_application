import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingLine3 extends StatelessWidget {
  const AnimatedLoadingLine3({
    super.key,
    required this.phase,
  });

  final int phase;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: 28,
            height: 28,
            child:
                phase >= 2
                    ? TweenAnimationBuilder<double>(
                      key: const ValueKey("tick1"),
                      tween: Tween(begin: 0.5, end: 1.2),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.elasticInOut, 
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        );
                      },
                    )
                    : CupertinoActivityIndicator(
                      key: ValueKey('spinner1'),
                      radius: 15,
                      color: Colors.white,
                    ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          phase >= 2 ? "Profile complete" : "Setting profile",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
