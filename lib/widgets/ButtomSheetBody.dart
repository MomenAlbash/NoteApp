import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/widgets/CustomTextFileldWidget.dart';

import 'CustomMaterialWidgets.dart';

class ButtomSheetBody extends StatefulWidget {

  const ButtomSheetBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtomSheetBody> createState() => _ButtomSheetBodyState();
}

class _ButtomSheetBodyState extends State<ButtomSheetBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(hintText: 'Enter the title',
            labelText: 'title',
            controller: _titleController,
            labelColor: Colors.lightBlueAccent,
            borderColor: Colors.white,

          ),
          const SizedBox(height: 20,),
          CustomTextField(hintText: 'Enter the content',
            labelText: 'content ',
            labelColor: Colors.lightBlueAccent,
            borderColor: Colors.white,
            controller: _contentController,
            minLines: 5,),
          Spacer(),
          MaterialButtonWidgets(onPressed: () {
            if (_formKey.currentState!.validate()) {
              // All fields are valid, proceed with login
              final title = _titleController.text;
              final content = _contentController.text;
              // Call your authentication method here
              // authService.login(email, password);
              _saveNote();
            }
          },
            MaterialText: 'Add',
            MaterialColor: Colors.lightBlueAccent,
            textColor: Colors.white,)
        ],
      ),
    );
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      final notesBox = Hive.box<Note>('notes');
      final note = Note(
        title: _titleController.text,
        content: _contentController.text,

      );
      notesBox.add(note);


      Navigator.pop(context);
    }
  }

}