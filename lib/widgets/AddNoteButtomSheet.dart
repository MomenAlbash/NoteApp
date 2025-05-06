
import 'package:flutter/material.dart';
import 'package:noteapp/widgets/AddNoteForm.dart';
class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:const Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AddNoteForm(),
          )),
    );

  }
}


