import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hoxton_wealth_project/UI/email_screen/email_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _showText = false;
  bool _logoShifted = false;
  bool _fadeOutInitialContent = false;
  bool _showFinalContent = false;
  bool _showFadeText = false;
  bool _moveTextToTop = false;
  bool _showButton = false;

  final List<bool> _showPoints = [false, false, false, false, false];

  final String _fullText = "HoxtonWealth";
  String _visibleText = "";
  late Timer timer;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  void _startTextTypingAnimation() {
    int index = 0;
    const duration = Duration(milliseconds: 60);

    timer = Timer.periodic(duration, (_) {
      if (index < _fullText.length) {
        setState(() {
          _visibleText += _fullText[index];
          index++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _animatePointsSequentially(int index) {
    if (index >= _showPoints.length) return;

    setState(() {
      _showPoints[index] = true;
    });

    Future.delayed(Duration(milliseconds: 500), () {
      _animatePointsSequentially(
        index + 1,
      ); // Trigger next point after current one finishes
    });
  }

  @override
  void initState() {
    super.initState();

    showD();
  }

  showD() async {
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(curve: Curves.easeOut, parent: _slideController));

    await Future.delayed(const Duration(milliseconds: 2000));

    setState(() {
      _logoShifted = true;
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _showText = true;
      _startTextTypingAnimation();
    });

    await Future.delayed(const Duration(milliseconds: 1000), () {});

    setState(() {
      _fadeOutInitialContent = true;
    });

    await Future.delayed(Duration(milliseconds: 1000), () {});
    setState(() {
      _showFinalContent = true;
    });
    _slideController.forward();

    await Future.delayed(Duration(milliseconds: 1200), () {});
    setState(() {
      _showFadeText = true;
    });

    await Future.delayed(Duration(milliseconds: 800), () {});
    setState(() {
      _moveTextToTop = true;
      Future.delayed(Duration(milliseconds: 800), () {
        _animatePointsSequentially(0);
      });
    });

    await Future.delayed(Duration(milliseconds: 4500), () {});

    setState(() {
      _showButton = true;
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004731),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset('assets/hoxton-icon-background-1.svg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/hoxton-icon-background-2.svg'),
          ),
          AnimatedOpacity(
            opacity: _fadeOutInitialContent ? 0.0 : 1.0,
            duration: Duration(milliseconds: 400),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 600),
              alignment: _logoShifted ? Alignment.centerLeft : Alignment.center,
              curve: Curves.easeOut,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 54.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/main_Icon.svg',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 10),

                    SizedBox(
                      width: _showText ? 200 : 0,
                      child: AnimatedOpacity(
                        opacity: _visibleText.isNotEmpty ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: Text(
                          _visibleText,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (_showFinalContent)
            AnimatedAlign(
              alignment: _moveTextToTop ? Alignment.topCenter : Alignment(0, 2),
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOut,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'Take Control ',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'PTSerif',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        AnimatedOpacity(
                          opacity: _showFadeText ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            'of Your',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'PTSerif',
                              color: Colors.green.shade200,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    AnimatedOpacity(
                      opacity: _showFadeText ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        'Wealth with Hoxton',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'PTSerif',
                          color: Colors.green.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    AnimatedOpacity(
                      opacity: _showFadeText ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        'Wealth App',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'PTSerif',
                          color: Colors.green.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    ...List.generate(5, (index) {
                      final pointTexts = [
                        "Organise Your Finances in One Place",
                        "Track Your Financial Performance",
                        "Free, Intuitive and Backed by Financial Experts ",
                        "Plan Your Financial Future",
                        "Security You Can Trust",
                      ];

                      final svgIcons = [
                        'assets/icon-1.svg',
                        'assets/icon-2.svg',
                        'assets/Icon-3.svg',
                        'assets/icon-4.svg',
                        'assets/icon-1.svg',
                      ];

                      return AnimatedSlide(
                        duration: Duration(milliseconds: 400),
                        offset:
                            _showPoints[index] ? Offset.zero : Offset(0, 0.5),
                        curve: Curves.easeOut,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 400),
                          opacity: _showPoints[index] ? 1.0 : 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: ListTile(
                              leading: SvgPicture.asset(
                                svgIcons[index],
                                width: 40,
                                height: 40,
                              ),

                              title: Text(
                                pointTexts[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'PTSerif',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 10.0),
                    if (_showButton)
                      AnimatedOpacity(
                        opacity: _showButton ? 1.0 : 0,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeIn,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => EmailScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
