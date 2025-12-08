import 'package:hive/hive.dart';

part 'prayer_entity.g.dart';

@HiveType(typeId: 0)
class PrayerEntity extends HiveObject {
  @HiveField(0)
  final PrayerTimings timings;

  @HiveField(1)
  final PrayerDate? date;

  @HiveField(2)
  final PrayerLocation? location;

  @HiveField(3)
  final bool? locationChanged;

  PrayerEntity({
    required this.timings,
    this.date,
    this.location,
    this.locationChanged,
  });

  PrayerEntity copyWith({
    PrayerTimings? timings,
    PrayerDate? date,
    PrayerLocation? location,
    bool? locationChanged,
  }) {
    return PrayerEntity(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      location: location ?? this.location,
      locationChanged: locationChanged ?? this.locationChanged,
    );
  }
}

@HiveType(typeId: 1)
class PrayerTimings {
  @HiveField(0)
  final String fajr;

  @HiveField(1)
  final String sunrise;

  @HiveField(2)
  final String dhuhr;

  @HiveField(3)
  final String asr;

  @HiveField(4)
  final String sunset;

  @HiveField(5)
  final String maghrib;

  @HiveField(6)
  final String isha;

  @HiveField(7)
  final String? imsak;

  @HiveField(8)
  final String? midnight;

  @HiveField(9)
  final String? firstthird;

  @HiveField(10)
  final String? lastthird;

  PrayerTimings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  factory PrayerTimings.fromJson(Map<String, dynamic> json) {
    return PrayerTimings(
      fajr: json['Fajr'] ?? '',
      sunrise: json['Sunrise'] ?? '',
      dhuhr: json['Dhuhr'] ?? '',
      asr: json['Asr'] ?? '',
      sunset: json['Sunset'] ?? '',
      maghrib: json['Maghrib'] ?? '',
      isha: json['Isha'] ?? '',
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstthird: json['Firstthird'],
      lastthird: json['Lastthird'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Sunset': sunset,
      'Maghrib': maghrib,
      'Isha': isha,
      'Imsak': imsak,
      'Midnight': midnight,
      'Firstthird': firstthird,
      'Lastthird': lastthird,
    };
  }
}

@HiveType(typeId: 2)
class PrayerDate {
  @HiveField(0)
  final String readable;

  @HiveField(1)
  final DateTime timestamp;

  PrayerDate({required this.readable, required this.timestamp});

  factory PrayerDate.fromJson(Map<String, dynamic> json) {
    return PrayerDate(
      readable: json['readable'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['timestamp'] ?? '0') * 1000,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'readable': readable,
      'timestamp': (timestamp.millisecondsSinceEpoch ~/ 1000).toString(),
    };
  }
}

@HiveType(typeId: 3)
class PrayerLocation {
  @HiveField(0)
  final double? latitude;

  @HiveField(1)
  final double? longitude;

  @HiveField(2)
  final String? timezone;

  PrayerLocation({this.latitude, this.longitude, this.timezone});

  factory PrayerLocation.fromJson(Map<String, dynamic> json) {
    return PrayerLocation(
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude, 'timezone': timezone};
  }
}
