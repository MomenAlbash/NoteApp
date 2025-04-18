import 'package:hive/hive.dart';

part 'note_model.g.dart'; // يجب أن يكون في أعلى الملف

@HiveType(typeId: 0) // typeId فريد لكل نموذج
class Note {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  Note({required this.title, required this.content});
}