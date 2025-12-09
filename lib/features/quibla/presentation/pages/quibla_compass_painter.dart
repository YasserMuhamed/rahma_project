import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_size.dart';

class QuiblaCompassPainter extends CustomPainter {
  final Color color;
  final int majorTickCount;
  final int minorTickCount;

  final CardinalityMap cardinalityMap;

  QuiblaCompassPainter({
    required this.color,
    this.majorTickCount = 18,
    this.minorTickCount = 90,
    this.cardinalityMap = const {0: 'N', 45: 'NE', 90: 'E', 135: 'SE', 180: 'S', 225: 'SW', 270: 'W', 315: 'NW', 360: 'N'},
  });

  late final majorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = color
    ..strokeWidth = 2;
  late final minorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = color.withValues(alpha: .7)
    ..strokeWidth = 1;

  late final majorScaleStyle = TextStyle(color: color, fontSize: safeSp(12));
  late final cardinalityStyle = TextStyle(color: AppColors.pureWhite, fontSize: safeSp(20), fontWeight: FontWeight.bold);

  late final _minorTicks = _layoutScale(minorTickCount);
  late final _majorTicks = _layoutScale(majorTickCount);
  late final _angleDegree = _layoutAngleScale(_majorTicks);
  @override
  void paint(Canvas canvas, Size size) {
    const origin = Offset.zero;
    final center = size.center(origin);
    final radius = size.width / 2;

    final majorTickLength = size.width * 0.08;
    final minorTickLength = size.width * 0.055;

    canvas.save();
    for (final angle in _majorTicks) {
      final tickStart = Offset.fromDirection(_correctAngle(angle).toRadius(), radius);
      final tickEnd = Offset.fromDirection(_correctAngle(angle).toRadius(), radius - majorTickLength);
      canvas.drawLine(center + tickStart, center + tickEnd, majorScalePaint);
    }
    for (final angle in _minorTicks) {
      final tickStart = Offset.fromDirection(_correctAngle(angle).toRadius(), radius);
      final tickEnd = Offset.fromDirection(_correctAngle(angle).toRadius(), radius - minorTickLength);
      canvas.drawLine(center + tickStart, center + tickEnd, minorScalePaint);
    }

    for (final angle in _angleDegree) {
      final textPadding = majorTickLength - size.width * 0.02;
      final textPainter = TextSpan(text: angle.toStringAsFixed(0), style: majorScaleStyle).toPainter()..layout();

      final layoutOffset = Offset.fromDirection(_correctAngle(angle).toRadius(), radius - textPadding);
      final offset = center + layoutOffset;

      canvas.restore();
      canvas.save();

      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(angle.toRadius());
      canvas.translate(-offset.dx, -offset.dy);

      textPainter.paint(canvas, Offset(offset.dx - (textPainter.width / 2), offset.dy));
    }
    for (final cardinality in cardinalityMap.entries) {
      final textPadding = majorTickLength + size.width * 0.01;
      final angle = cardinality.key.toDouble();
      final text = cardinality.value;
      final textPainter = TextSpan(
        text: text,
        style: cardinalityStyle.copyWith(color: text == 'N' ? Colors.red : color),
      ).toPainter()..layout();

      final layoutOffset = Offset.fromDirection(_correctAngle(angle).toRadius(), radius - textPadding);
      final offset = center + layoutOffset;

      canvas.restore();
      canvas.save();

      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(angle.toRadius());
      canvas.translate(-offset.dx, -offset.dy);

      textPainter.paint(canvas, Offset(offset.dx - (textPainter.width / 2), offset.dy));
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<double> _layoutScale(int ticks) {
    final scale = 360 / ticks;
    return List.generate(ticks, (index) => scale * index);
  }

  List<double> _layoutAngleScale(List<double> ticks) {
    List<double> angles = [];
    for (var i = 0; i < ticks.length; i++) {
      if (i == ticks.length - 1) {
        double degreeVal = (ticks[i] + 360) / 2;
        angles.add(degreeVal);
      } else {
        double degreeVal = (ticks[i] + ticks[i + 1]) / 2;
        angles.add(degreeVal);
      }
    }
    return angles;
  }

  double _correctAngle(double angle) => angle - 90;
}

typedef CardinalityMap = Map<num, String>;

extension on num {
  double toRadius() => this * pi / 180;
}

extension on TextSpan {
  TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) => TextPainter(text: this, textDirection: textDirection);
}
