import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

Future<String> getAddressFromCoordinates(double latitude, double longitude) async {
  try {
    await setLocaleIdentifier(Intl.getCurrentLocale() == "ar" ? 'ar_EG' : 'en_US');
    final List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isEmpty) return '';

    final p = placemarks.first;
    return [p.thoroughfare, p.locality, p.administrativeArea, p.country].where((s) => s != null && s.isNotEmpty).join(', ');
  } catch (e) {
    return '';
  }
}
