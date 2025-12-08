import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromCoordinates(
  double latitude,
  double longitude,
) async {
  try {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    if (placemarks.isEmpty) return '';

    final p = placemarks.first;
    return [
      p.thoroughfare, // more accurate than 'street' (street name)
      p.locality,
      p.administrativeArea,
      p.country,
    ].where((s) => s != null && s.isNotEmpty).join(', ');
  } catch (e) {
    return '';
  }
}
