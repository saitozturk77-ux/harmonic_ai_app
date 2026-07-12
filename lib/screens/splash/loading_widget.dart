import 'dart:async';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  int dots = 0;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    Timer.periodic(
      const Duration(milliseconds: 350),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          dots = (dots + 1) % 4;
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.82),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: 0.75 + (_controller.value * 0.25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  "INITIALIZING${"." * dots}",
                  style: const TextStyle(
                    color: Color(0xFF7CFF5B),
                    fontSize: 15,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: 190,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      minHeight: 3,
                      backgroundColor: Colors.white10,
                      value: _controller.value,
                      valueColor: const AlwaysStoppedAnimation(
                        Color(0xFF7CFF5B),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "Loading Forex AI Engine",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.45),
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}