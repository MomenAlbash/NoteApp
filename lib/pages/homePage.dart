import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/change_theme_cubit/change_theme_cubit.dart';
import 'package:noteapp/widgets/AddNoteButtomSheet.dart';
import 'package:noteapp/widgets/CustomMaterialWidgets.dart';
import 'package:noteapp/widgets/CustomTextFileldWidget.dart';
import 'package:noteapp/widgets/notes_list_view.dart';

import '../widgets/AddNoteForm.dart';
import '../widgets/CustomConatainerWidgets.dart';
import '../widgets/appBarWidgetr.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  static String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: 'Notes',
        icon: Icon(Icons.search),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) => const AddNoteButtomSheet(),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: NotesListView(),
    );
  }
}
