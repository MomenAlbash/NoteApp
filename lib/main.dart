import 'package:flutter/material.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/pages/edit_note_page.dart';
import 'package:noteapp/pages/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart'; // استخدم هذه
void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Hive
  await Hive.initFlutter();

  // تسجيل المهايئ (Adapter)
  Hive.registerAdapter(NoteAdapter());

  // فتح صندوق الملاحظات
  await Hive.openBox<Note>('notes');


  runApp(NoteApp());
}
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes:{
        homePage.id: (context) => homePage(),
        EditNotePage.id :(context) => EditNotePage()
      },
      initialRoute: homePage.id
    );
  }
}
