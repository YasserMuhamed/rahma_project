import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'timings.g.dart';

@HiveType(typeId: 1)
class Timings extends Equatable {
  @HiveField(0)
  final String? fajr;
  @HiveField(1)
  final String? sunrise;
  @HiveField(2)
  final String? dhuhr;
  @HiveField(3)
  final String? asr;
  @HiveField(4)
  final String? sunset;
  @HiveField(5)
  final String? maghrib;
  @HiveField(6)
  final String? isha;
  @HiveField(7)
  final String? imsak;
  @HiveField(8)
  final String? midnight;
  @HiveField(9)
  final String? firstthird;
  @HiveField(10)
  final String? lastthird;

  const Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json['Fajr'] as String?,
    sunrise: json['Sunrise'] as String?,
    dhuhr: json['Dhuhr'] as String?,
    asr: json['Asr'] as String?,
    sunset: json['Sunset'] as String?,
    maghrib: json['Maghrib'] as String?,
    isha: json['Isha'] as String?,
    imsak: json['Imsak'] as String?,
    midnight: json['Midnight'] as String?,
    firstthird: json['Firstthird'] as String?,
    lastthird: json['Lastthird'] as String?,
  );

  Map<String, dynamic> toJson() => {
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

  List<MapEntry<String, String>> toList() {
    return [
      MapEntry('Fajr', fajr ?? ''),
      MapEntry('Sunrise', sunrise ?? ''),
      MapEntry('Dhuhr', dhuhr ?? ''),
      MapEntry('Asr', asr ?? ''),
      MapEntry('Sunset', sunset ?? ''),
      MapEntry('Maghrib', maghrib ?? ''),
      MapEntry('Isha', isha ?? ''),
      MapEntry('Imsak', imsak ?? ''),
      MapEntry('Midnight', midnight ?? ''),
      MapEntry('Firstthird', firstthird ?? ''),
      MapEntry('Lastthird', lastthird ?? ''),
    ];
  }

  @override
  List<Object?> get props {
    return [fajr, sunrise, dhuhr, asr, sunset, maghrib, isha, imsak, midnight, firstthird, lastthird];
  }
}
