import 'package:flutter/material.dart';

class AnimScreen extends StatefulWidget {
  const AnimScreen({Key? key}) : super(key: key);

  @override
  _AnimScreenState createState() => _AnimScreenState();
}

class _AnimScreenState extends State<AnimScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  // late ReverseAnimation reverseAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2),
        vsync: this)..repeat(reverse: true);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            color: Colors.blue,
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
