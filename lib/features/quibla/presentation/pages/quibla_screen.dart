import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_size.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/helpers/latlng.dart';
import 'package:rahma_project/core/utils/functions/determine_current_location.dart';
import 'package:rahma_project/features/quibla/presentation/manager/quibla_calculations.dart';
import 'package:rahma_project/features/quibla/presentation/pages/quibla_compass_painter.dart';
import 'package:rahma_project/features/quibla/presentation/widgets/neumorphism.dart';

class QuiblaScreen extends StatefulWidget {
  const QuiblaScreen({super.key});

  @override
  State<QuiblaScreen> createState() => _QuiblaScreenState();
}

class _QuiblaScreenState extends State<QuiblaScreen> {
  @override
  void initState() {
    _fetchPermissionStatus();
    super.initState();
  }

  LatLng? currentLocation;
  double? lastStableHeading;

  void _fetchPermissionStatus() {
    requestPermission().then((value) {
      setState(() => hasPermission = value == LocationPermission.always || value == LocationPermission.whileInUse);
      if (hasPermission) {
        determinePositionWithCache().then((value) => setState(() => currentLocation = LatLng(value.latitude, value.longitude)));
      }
    });
  }

  bool _hasGivenFeedback = false;
  bool hasPermission = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (hasPermission && currentLocation != null) {
            return StreamBuilder<CompassEvent>(
              stream: FlutterCompass.events,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  return Text('Error reading heading: ${asyncSnapshot.error}');
                }

                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                double? direction = asyncSnapshot.data!.heading;

                if (direction == null) return Center(child: Text("Device does not have sensors !"));

                double qibla = qiblaDirection(currentLocation!.latitude!, currentLocation!.longitude!);

                // Correct angle calculation - both should point in same direction when aligned
                double compassAngle = -direction * pi / 180;
                double qiblaAngle = -qibla * pi / 180; // Both use same rotation direction

                // Calculate difference to show user how aligned they are
                double difference = (qibla - direction).abs();
                if (difference > 180) difference = 360 - difference;
                bool isAligned = difference < 5; // Within 5 degrees

                if (isAligned && !_hasGivenFeedback) {
                  HapticFeedback.lightImpact();
                  _hasGivenFeedback = true;
                } else if (!isAligned && _hasGivenFeedback) {
                  // Reset feedback flag when user moves away from alignment
                  _hasGivenFeedback = false;
                }

                return Stack(
                  children: [
                    // Rotating Compass
                    Transform.rotate(
                      angle: compassAngle,
                      child: Neumorphism(
                        outerShadow: false,
                        margin: EdgeInsets.all(size.width * 0.1),
                        padding: EdgeInsets.all(10),
                        child: CustomPaint(
                          painter: QuiblaCompassPainter(color: AppColors.pureWhite),
                          size: size,
                        ),
                      ),
                    ),

                    // Center Display
                    CenterDisplayMeter(direction: direction, qiblaDirection: qibla, isAligned: isAligned),

                    // Phone Direction Indicator (Red Arrow) - rotates with compass
                    Positioned.fill(
                      child: Center(
                        child: Transform.rotate(
                          angle: compassAngle,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                offset: Offset(0, -size.width * 0.32),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(color: Colors.red.shade600, shape: BoxShape.circle),
                                      child: Icon(Icons.location_on, color: Colors.white, size: 28),
                                    ),
                                    Container(
                                      width: 5,
                                      height: size.width * .18,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColors.discountRed,
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Qibla Direction Indicator (Green Arrow) - stays fixed, on top
                    Positioned.fill(
                      child: Center(
                        child: Transform.rotate(
                          angle: qiblaAngle,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                offset: Offset(0, -size.width * 0.32),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Green Kaaba icon pointing to Qibla
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: isAligned ? Colors.green.shade400 : Colors.green.shade600,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(color: Colors.green.withOpacity(0.8), blurRadius: 15, spreadRadius: isAligned ? 5 : 2),
                                        ],
                                      ),
                                      child: Icon(Icons.mosque, color: Colors.white, size: 28),
                                    ),
                                    Container(
                                      width: 6,
                                      height: size.width * .18,
                                      decoration: BoxDecoration(
                                        color: isAligned ? Colors.green.shade400 : Colors.green.shade600,
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                                        boxShadow: [BoxShadow(color: Colors.green.withOpacity(0.5), blurRadius: 10)],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Alignment Status at the top
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: isAligned ? Colors.green.withOpacity(0.9) : Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: isAligned ? Colors.green : Colors.white.withOpacity(0.3), width: 2),
                          ),
                          child: Text(
                            isAligned ? context.t.aligned_with_qibla : context.t.rotate_to_align_arrows,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Location Permission Required'),
                  ElevatedButton(
                    child: Text('Request Permissions'),
                    onPressed: () {
                      requestPermission();
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class CenterDisplayMeter extends StatelessWidget {
  const CenterDisplayMeter({super.key, required this.direction, required this.qiblaDirection, required this.isAligned});

  final double direction;
  final double qiblaDirection;
  final bool isAligned;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double difference = (qiblaDirection - direction).abs();
    if (difference > 180) difference = 360 - difference;

    return Neumorphism(
      margin: EdgeInsets.all(size.width * 0.27),
      distance: 2.5,
      blur: 5,
      child: Neumorphism(
        margin: EdgeInsets.all(size.width * 0.01),
        distance: 0,
        blur: 0,
        innerShadow: true,
        isReverse: true,
        child: Neumorphism(
          margin: EdgeInsets.all(size.width * 0.05),
          distance: 4,
          blur: 5,
          child: TopGradientBox(
            margin: EdgeInsets.all(size.width * 0.02),
            padding: EdgeInsets.all(size.width * 0.02),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isAligned ? [Colors.green.shade700, Colors.green.shade500] : [AppColors.hunterGreen, AppColors.vibrantEmerald],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${headingToDegree(direction).toStringAsFixed(0)}°",
                    style: TextStyle(color: AppColors.pureWhite, fontSize: safeSP(32), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    context.t.quibla_angle(qiblaDirection.toStringAsFixed(0)),
                    style: TextStyle(color: AppColors.pureWhite.withOpacity(0.8), fontSize: safeSP(12)),
                  ),
                  if (!isAligned)
                    Text(
                      context.t.off_angle(difference.toStringAsFixed(0)),
                      style: TextStyle(color: AppColors.pureWhite.withOpacity(0.6), fontSize: safeSP(10)),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double headingToDegree(double heading) => heading < 0 ? 360 - heading.abs() : heading;
