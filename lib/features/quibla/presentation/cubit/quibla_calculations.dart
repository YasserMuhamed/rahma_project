import 'dart:math';

double qiblaDirection(double userLat, double userLng) {
  const kaabaLat = 21.4224779;
  const kaabaLng = 39.8251832;

  double userLatRad = userLat * pi / 180;
  double userLngRad = userLng * pi / 180;
  double kaabaLatRad = kaabaLat * pi / 180;
  double kaabaLngRad = kaabaLng * pi / 180;

  double dLng = kaabaLngRad - userLngRad;

  double y = sin(dLng);
  double x = cos(userLatRad) * tan(kaabaLatRad) - sin(userLatRad) * cos(dLng);

  double bearing = atan2(y, x);

  bearing = bearing * 180 / pi;

  if (bearing < 0) bearing += 360;

  return bearing;
}
