import 'package:flutter/material.dart';

class DragWidget extends StatelessWidget {
  const DragWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white.withValues(alpha: .7)),
    );
  }
}
