import 'package:flutter/material.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/widgets/CustomTextFileldWidget.dart';

import 'CustomMaterialWidgets.dart';

class AddNoteForm extends StatefulWidget {

  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtile;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(hintText: 'Enter the title',
            labelText: 'title',
            controller: _titleController,
            onSaved: (value) {
              title = value;
            },
            labelColor: kprimaryColor,
          ),
          const SizedBox(height: 20,),
          CustomTextField(hintText: 'Enter the content',
            labelText: 'content ',
            labelColor: kprimaryColor,
            controller: _contentController,
            onSaved: (value) {
              subtile = value;
            },
            minLines: 5,),
          const Spacer(),
          MaterialButtonWidgets(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                NoteModel noteModel= NoteModel(Color: 1, date: DateTime.now().toString(), title: title!, subtitle: subtile!);
                AddNoteCubit.get(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
              setState(() {

              });
            },
            MaterialText: 'Add',
            MaterialColor: kprimaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }


  void ValidateTextField(
      {required AutovalidateMode autovalidateMode, required GlobalKey<
          FormState> formKey}) {

  }
}