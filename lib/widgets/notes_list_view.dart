import 'package:flutter/material.dart';
import 'package:noteapp/widgets/CustomConatainerWidgets.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomContainerWidget();
      },
    );
  }
}