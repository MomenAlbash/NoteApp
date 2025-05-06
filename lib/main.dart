import 'package:flutter/material.dart';
import 'package:noteapp/change_theme_cubit/change_theme_cubit.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/pages/edit_note_page.dart';
import 'package:noteapp/pages/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart'; // استخدم هذه
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/widgets/themeModeWigets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Hive
  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);


  runApp(const NoteApp());
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
            debugShowCheckedModeBanner: false,
            darkTheme: DarkThemeMode(),
            theme: LigthThemeMode(),
            themeMode: ChangeThemeCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            initialRoute: homePage.id,
          );
        },
      ),
    );
  }


}
