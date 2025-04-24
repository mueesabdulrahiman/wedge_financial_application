import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoxton_wealth_project/UI/animated_loading_Screen/widgets/animated_loading_line1.dart';
import 'package:hoxton_wealth_project/UI/animated_loading_Screen/widgets/animated_loading_line3.dart';
import 'package:hoxton_wealth_project/UI/dashboard_screen/dashboard_screen.dart';
import 'package:hoxton_wealth_project/UI/animated_loading_Screen/widgets/animated_loading_line4.dart';
import 'package:hoxton_wealth_project/UI/animated_loading_Screen/widgets/animated_loading_line2.dart';

class AnimatedLoadingDashboardScreen extends StatefulWidget {
  const AnimatedLoadingDashboardScreen({super.key});

  @override
  State<AnimatedLoadingDashboardScreen> createState() => _AnimatedLoadingDashboardScreen();
}

class _AnimatedLoadingDashboardScreen extends State<AnimatedLoadingDashboardScreen> {
  int phase = 1;
  String animatedDots = "";
  late final ticker;

  String _currentSubtitle = "";

  void _startDotAnimation() {
    int count = 0;
    ticker = Stream.periodic(Duration(milliseconds: 500), (_) {
      count = (count + 1) % 4;
      setState(() => animatedDots = '.' * count);
    }).listen((_) {});
  }

  void _startPhases() async {
    final dashboardNavigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      phase = 2;
      _updateSubtitle();
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      phase = 3;
      _updateSubtitle();
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      phase = 4;
      _updateSubtitle();
    });
    await Future.delayed(const Duration(seconds: 2));
    // Navigate to dashboard screen

    if (mounted) {
      dashboardNavigator.pushReplacement(
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
    }
  }

  void _updateSubtitle() {
    final newSubtitle = _getSubtitleText();
    if (_currentSubtitle != newSubtitle) {
      _currentSubtitle = newSubtitle;
    }
  }

  @override
  void initState() {
    super.initState();
    _currentSubtitle = _getSubtitleText();
    _startDotAnimation();
    _startPhases();
  }

  @override
  void dispose() {
    ticker.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF004731),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top Title
                  
                  AnimatedLoadingLine1(phase: phase, animatedDots: animatedDots),

                  const SizedBox(height: 16),

                  // Subtitle
                  AnimatedLoadingLine2(text: _currentSubtitle),

                  const SizedBox(height: 28),

                  // Row 1

                  AnimatedLoadingLine3(phase: phase),
                  const SizedBox(height: 5),

                  // Row 2
                  AnimatedLoadingLine4(phase: phase),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getSubtitleText() {
    if (phase == 4) return "All set";
    if (phase == 2 || phase == 3) return "You're nearly there...";
    return "It will only take a moment, John";
  }
}





