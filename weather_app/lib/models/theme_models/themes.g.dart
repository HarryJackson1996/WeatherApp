// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeKeyAdapter extends TypeAdapter<ThemeKey> {
  @override
  final int typeId = 0;

  @override
  ThemeKey read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeKey.LIGHT;
      case 1:
        return ThemeKey.DARK;
      case 2:
        return ThemeKey.CUSTOM;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeKey obj) {
    switch (obj) {
      case ThemeKey.LIGHT:
        writer.writeByte(0);
        break;
      case ThemeKey.DARK:
        writer.writeByte(1);
        break;
      case ThemeKey.CUSTOM:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeKeyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
