// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerEntityAdapter extends TypeAdapter<PrayerEntity> {
  @override
  final int typeId = 0;

  @override
  PrayerEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerEntity(
      timings: fields[0] as PrayerTimings,
      date: fields[1] as PrayerDate?,
      location: fields[2] as PrayerLocation?,
      locationChanged: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timings)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.locationChanged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PrayerTimingsAdapter extends TypeAdapter<PrayerTimings> {
  @override
  final int typeId = 1;

  @override
  PrayerTimings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerTimings(
      fajr: fields[0] as String,
      sunrise: fields[1] as String,
      dhuhr: fields[2] as String,
      asr: fields[3] as String,
      sunset: fields[4] as String,
      maghrib: fields[5] as String,
      isha: fields[6] as String,
      imsak: fields[7] as String?,
      midnight: fields[8] as String?,
      firstthird: fields[9] as String?,
      lastthird: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerTimings obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.isha)
      ..writeByte(7)
      ..write(obj.imsak)
      ..writeByte(8)
      ..write(obj.midnight)
      ..writeByte(9)
      ..write(obj.firstthird)
      ..writeByte(10)
      ..write(obj.lastthird);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerTimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PrayerDateAdapter extends TypeAdapter<PrayerDate> {
  @override
  final int typeId = 2;

  @override
  PrayerDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerDate(
      readable: fields[0] as String,
      timestamp: fields[1] as DateTime,
      hijri: fields[2] as HijriDate?,
      gregorian: fields[3] as GregorianDate?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerDate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.readable)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.hijri)
      ..writeByte(3)
      ..write(obj.gregorian);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HijriDateAdapter extends TypeAdapter<HijriDate> {
  @override
  final int typeId = 3;

  @override
  HijriDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HijriDate(
      date: fields[0] as String,
      day: fields[1] as String,
      month: fields[2] as HijriMonth?,
      year: fields[3] as String,
      weekday: fields[4] as HijriWeekday?,
    );
  }

  @override
  void write(BinaryWriter writer, HijriDate obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.weekday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HijriMonthAdapter extends TypeAdapter<HijriMonth> {
  @override
  final int typeId = 4;

  @override
  HijriMonth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HijriMonth(
      number: fields[0] as int,
      en: fields[1] as String,
      ar: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HijriMonth obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.ar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriMonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HijriWeekdayAdapter extends TypeAdapter<HijriWeekday> {
  @override
  final int typeId = 5;

  @override
  HijriWeekday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HijriWeekday(
      en: fields[0] as String,
      ar: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HijriWeekday obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.en)
      ..writeByte(1)
      ..write(obj.ar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriWeekdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GregorianDateAdapter extends TypeAdapter<GregorianDate> {
  @override
  final int typeId = 6;

  @override
  GregorianDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GregorianDate(
      date: fields[0] as String,
      day: fields[1] as String,
      month: fields[2] as GregorianMonth?,
      year: fields[3] as String,
      weekday: fields[4] as GregorianWeekday?,
    );
  }

  @override
  void write(BinaryWriter writer, GregorianDate obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.weekday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GregorianDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GregorianMonthAdapter extends TypeAdapter<GregorianMonth> {
  @override
  final int typeId = 7;

  @override
  GregorianMonth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GregorianMonth(
      number: fields[0] as int,
      en: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GregorianMonth obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GregorianMonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GregorianWeekdayAdapter extends TypeAdapter<GregorianWeekday> {
  @override
  final int typeId = 8;

  @override
  GregorianWeekday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GregorianWeekday(
      en: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GregorianWeekday obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GregorianWeekdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PrayerLocationAdapter extends TypeAdapter<PrayerLocation> {
  @override
  final int typeId = 9;

  @override
  PrayerLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerLocation(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
      timezone: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerLocation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.timezone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
