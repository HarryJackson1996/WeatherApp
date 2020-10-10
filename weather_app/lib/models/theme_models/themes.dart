
import 'package:hive/hive.dart';
part 'themes.g.dart';

@HiveType(typeId: 0)
enum ThemeKey {
  @HiveField(0)
  LIGHT, 

  @HiveField(1)
  DARK,
  
  @HiveField(2)
  CUSTOM
}

