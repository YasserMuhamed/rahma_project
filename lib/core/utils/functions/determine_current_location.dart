import 'package:geolocator/geolocator.dart';
import 'package:rahma_project/core/helpers/latlng.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  // Use optimized location settings for faster acquisition
  return await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.medium, // Faster than high accuracy
      distanceFilter: 10, // Only update if moved 10 meters
      timeLimit: Duration(seconds: 10), // Timeout after 10 seconds
    ),
  );
}

Future<LocationPermission> requestPermission() {
  return Geolocator.requestPermission();
}

/// Get cached location if available, otherwise get current position
Future<Position> determinePositionWithCache() async {
  try {
    final lastKnownPosition = await Geolocator.getLastKnownPosition();
    if (lastKnownPosition != null) {
      final now = DateTime.now();
      final positionTime = lastKnownPosition.timestamp;
      if (now.difference(positionTime).inMinutes <= 5) {
        return lastKnownPosition;
      }
    }
  } catch (_) {}

  return await determinePosition();
}

Future<bool> checkChangeInLocation(LatLng position1, LatLng position2) async {
  final distance = Geolocator.distanceBetween(
    position1.latitude ?? 0,
    position1.longitude ?? 0,
    position2.latitude ?? 0,
    position2.longitude ?? 0,
  );
  return distance > 10000; // 10 km
}
