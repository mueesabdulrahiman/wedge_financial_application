import 'package:flutter/material.dart';

class AnimatedLoadingLine2 extends StatefulWidget {
  final String text;

  const AnimatedLoadingLine2({super.key, required this.text});

  @override
  State<AnimatedLoadingLine2> createState() => _AnimatedLoadingLine2State();
}

class _AnimatedLoadingLine2State extends State<AnimatedLoadingLine2>
    with TickerProviderStateMixin {
  late final AnimationController _outgoingController;
  late final Animation<Offset> _outgoingAnimation;
  late final AnimationController _incomingController;
  late final Animation<Offset> _incomingAnimation;

  String _currentText = "";
  String _nextText = "";

  @override
  void initState() {
    super.initState();
    _currentText = widget.text;

    _outgoingController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _incomingController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _setupAnimations();
  }



  void _setupAnimations() {
    _outgoingAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1),
    ).animate(
      CurvedAnimation(parent: _outgoingController, curve: Curves.easeInOut),
    );

    _incomingAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _incomingController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(AnimatedLoadingLine2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != _currentText) {
      _nextText = widget.text;
      _startTransition();
    }
  }

  void _startTransition() async {
    await _outgoingController.forward();

    setState(() {
      _currentText = _nextText;
    });

    _outgoingController.reset();

    await _incomingController.forward();
    _incomingController.reset();
  }

  @override
  void dispose() {
    _outgoingController.dispose();
    _incomingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        // color: Colors.red,
        height: 28,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SlideTransition(
              position: _outgoingAnimation,
              child: Text(
                _currentText,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),

            if (_nextText != _currentText)
              SlideTransition(
                position: _incomingAnimation,
                child: Text(
                  _nextText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
