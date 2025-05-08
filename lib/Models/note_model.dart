import 'dart:ui';
import 'dart:ui';

import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int Color;
  NoteModel({required this.Color, required this.date, required this.title, required this.subtitle});
}