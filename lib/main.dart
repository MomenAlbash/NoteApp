import 'package:flutter/material.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/change_theme_cubit/change_theme_cubit.dart';
import 'package:noteapp/pages/edit_note_page.dart';
import 'package:noteapp/pages/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart'; // استخدم هذه
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Hive
  await Hive.initFlutter();

  // تسجيل المهايئ (Adapter)
  Hive.registerAdapter(NoteAdapter());

  // فتح صندوق الملاحظات
  await Hive.openBox<Note>('notes');
  // test Branch
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
              routes: {
                homePage.id: (context) => homePage(),
                EditNotePage.id: (context) => EditNotePage()
              },
              initialRoute: homePage.id,
              theme: _getThemeData(state),
          );
        },
      ),
    );
  }

  ThemeData _getThemeData(ChangeThemeState state) {
    if (state is DarkThemeState) {
      return ThemeData.dark();
    } else if (state is LightThemeState) {
      return ThemeData.light();
    } else {
      return ThemeData.light(); // Default theme
    }
  }


}
