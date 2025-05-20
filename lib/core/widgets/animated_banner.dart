import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedImageLoop extends StatefulWidget {
  const AnimatedImageLoop({super.key});

  @override
  AnimatedImageLoopState createState() => AnimatedImageLoopState();
}

class AnimatedImageLoopState extends State<AnimatedImageLoop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Image.asset(
          'assets/img/b.PNG',
          fit: BoxFit.cover,
          height: 70.h,
          width: double.infinity,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
