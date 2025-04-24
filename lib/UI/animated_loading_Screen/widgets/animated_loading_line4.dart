import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingLine4 extends StatelessWidget {
  final int phase;
  const AnimatedLoadingLine4({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    final bool isPhase2 = phase >= 2;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 80,
        padding: const EdgeInsets.only(bottom: 6),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                if (phase >= 2) Colors.white else Colors.transparent,
              ],
              stops:
                  phase >= 2
                      ? [0.0, 1.0]
                      : [0.4, 0.6], // More visible part, less hidden
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //   Animated
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: phase >= 3
                    ? IconChange(phase)
                    : Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(
                            isPhase2 ? 1.0 : 0.7,
                          ),
                          width: 1.5,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
              ),
              const SizedBox(width: 12),
              // Animated
              Opacity(
                //  duration: const Duration(milliseconds: 500),
                opacity: isPhase2 ? 1.0 : 0.4,
                child: const Text(
                  "Setting up your dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget IconChange(int phase) {
  return SizedBox(
    height: 28,
    width: 28,
    child:
  phase == 3
      ? CupertinoActivityIndicator(
        key: ValueKey("spinner2"),
        radius: 15,
        color: Colors.white,
      )
      : TweenAnimationBuilder<double>(
        key: ValueKey("tick2"),
        tween: Tween(begin: 0.3, end: 1.2),
        duration: const Duration(milliseconds: 800),
        curve: Curves.elasticInOut, // Bounce effect
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Icon(
              Icons.check_circle,
              color: Colors.white,
              // size: 28
            ),
          );
        },
      ));

  // AnimatedSize(
  //   duration: Duration(milliseconds: 200),

  //   child: Icon(
  //     Icons.check_circle,
  //     key: const ValueKey("tick2"),
  //     color: Colors.white,
  //     size: 28,
  //   ),
  // );
}
