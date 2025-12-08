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

  PrayerEntity({required this.timings, this.date, this.location, this.locationChanged});

  PrayerEntity copyWith({PrayerTimings? timings, PrayerDate? date, PrayerLocation? location, bool? locationChanged}) {
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

  @HiveField(2)
  final HijriDate? hijri;

  @HiveField(3)
  final GregorianDate? gregorian;

  PrayerDate({required this.readable, required this.timestamp, this.hijri, this.gregorian});

  factory PrayerDate.fromJson(Map<String, dynamic> json) {
    return PrayerDate(
      readable: json['readable'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(int.parse(json['timestamp'] ?? '0') * 1000),
      hijri: json['hijri'] != null ? HijriDate.fromJson(json['hijri']) : null,
      gregorian: json['gregorian'] != null ? GregorianDate.fromJson(json['gregorian']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'readable': readable,
      'timestamp': (timestamp.millisecondsSinceEpoch ~/ 1000).toString(),
      'hijri': hijri?.toJson(),
      'gregorian': gregorian?.toJson(),
    };
  }
}

@HiveType(typeId: 3)
class HijriDate {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final String day;

  @HiveField(2)
  final HijriMonth? month;

  @HiveField(3)
  final String year;

  @HiveField(4)
  final HijriWeekday? weekday;

  HijriDate({required this.date, required this.day, this.month, required this.year, this.weekday});

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      date: json['date'] ?? '',
      day: json['day'] ?? '',
      month: json['month'] != null ? HijriMonth.fromJson(json['month']) : null,
      year: json['year'] ?? '',
      weekday: json['weekday'] != null ? HijriWeekday.fromJson(json['weekday']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'day': day, 'month': month?.toJson(), 'year': year, 'weekday': weekday?.toJson()};
  }
}

@HiveType(typeId: 4)
class HijriMonth {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final String en;

  @HiveField(2)
  final String ar;

  HijriMonth({required this.number, required this.en, required this.ar});

  factory HijriMonth.fromJson(Map<String, dynamic> json) {
    return HijriMonth(number: json['number'] ?? 0, en: json['en'] ?? '', ar: json['ar'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'number': number, 'en': en, 'ar': ar};
  }
}

@HiveType(typeId: 5)
class HijriWeekday {
  @HiveField(0)
  final String en;

  @HiveField(1)
  final String ar;

  HijriWeekday({required this.en, required this.ar});

  factory HijriWeekday.fromJson(Map<String, dynamic> json) {
    return HijriWeekday(en: json['en'] ?? '', ar: json['ar'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'en': en, 'ar': ar};
  }
}

@HiveType(typeId: 6)
class GregorianDate {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final String day;

  @HiveField(2)
  final GregorianMonth? month;

  @HiveField(3)
  final String year;

  @HiveField(4)
  final GregorianWeekday? weekday;

  GregorianDate({required this.date, required this.day, this.month, required this.year, this.weekday});

  factory GregorianDate.fromJson(Map<String, dynamic> json) {
    return GregorianDate(
      date: json['date'] ?? '',
      day: json['day'] ?? '',
      month: json['month'] != null ? GregorianMonth.fromJson(json['month']) : null,
      year: json['year'] ?? '',
      weekday: json['weekday'] != null ? GregorianWeekday.fromJson(json['weekday']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'day': day, 'month': month?.toJson(), 'year': year, 'weekday': weekday?.toJson()};
  }
}

@HiveType(typeId: 7)
class GregorianMonth {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final String en;

  GregorianMonth({required this.number, required this.en});

  factory GregorianMonth.fromJson(Map<String, dynamic> json) {
    return GregorianMonth(number: json['number'] ?? 0, en: json['en'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'number': number, 'en': en};
  }
}

@HiveType(typeId: 8)
class GregorianWeekday {
  @HiveField(0)
  final String en;

  GregorianWeekday({required this.en});

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) {
    return GregorianWeekday(en: json['en'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'en': en};
  }
}

@HiveType(typeId: 9)
class PrayerLocation {
  @HiveField(0)
  final double? latitude;

  @HiveField(1)
  final double? longitude;

  @HiveField(2)
  final String? timezone;

  PrayerLocation({this.latitude, this.longitude, this.timezone});

  factory PrayerLocation.fromJson(Map<String, dynamic> json) {
    return PrayerLocation(latitude: json['latitude']?.toDouble(), longitude: json['longitude']?.toDouble(), timezone: json['timezone']);
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude, 'timezone': timezone};
  }
}
