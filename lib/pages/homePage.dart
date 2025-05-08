import 'package:flutter/material.dart';

import 'package:noteapp/widgets/AddNoteButtomSheet.dart';
import 'package:noteapp/widgets/notes_list_view.dart';

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
