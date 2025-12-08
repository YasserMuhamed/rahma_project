import 'package:hive_flutter/adapters.dart';

part 'latlng.g.dart';

@HiveType(typeId: 0)
class LatLng {
  @HiveField(0)
  final double? latitude;

  @HiveField(1)
  final double? longitude;

  LatLng(this.latitude, this.longitude);
}
