import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class CelebrationScreen extends StatefulWidget {
  @override
  _CelebrationScreenState createState() => _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final ConfettiController _confettiController;

  String _displayText = "Welcome to the Celebration!";

  @override
  void initState() {
    super.initState();

    // Animation controller for scaling effect
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Confetti controller
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _startCelebration() {
    setState(() {
      _displayText = "Happy New Year 2025! 🎉";
    });
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Confetti effect
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 30,
              maxBlastForce: 10,
              minBlastForce: 5,
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.purple,
              ],
            ),
          ),
          // Center content with scaling animation
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Text(
                        '🎉 2025 🎉',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.red,
                              offset: Offset(0, 0),
                            ),
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.blue,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Additional Text
                Text(
                  _displayText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Add a floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _startCelebration,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.celebration, color: Colors.white),
      ),
    );
  }
}
