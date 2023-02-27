import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math';

class UseAnimationHooksScreen extends HookWidget {
  const UseAnimationHooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: Duration(seconds: 4),
    );
    controller.repeat();
    return Scaffold(
      appBar: AppBar(
        title: Text("useAnimation Sample"),
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
