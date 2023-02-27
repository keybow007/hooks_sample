import 'package:flutter/material.dart';
import 'dart:math';

class UseAnimationNoHooksScreen extends StatefulWidget {
  const UseAnimationNoHooksScreen({Key? key}) : super(key: key);

  @override
  State<UseAnimationNoHooksScreen> createState() => _UseAnimationNoHooksScreenState();
}

class _UseAnimationNoHooksScreenState extends State<UseAnimationNoHooksScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("useAnimation No Hooks"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: controller.value * 2 * pi,
              child: child,
            );
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
