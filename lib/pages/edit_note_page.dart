import 'package:flutter/material.dart';
import 'package:noteapp/widgets/CustomTextFileldWidget.dart';
import 'package:noteapp/widgets/appBarWidgetr.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});
  static String id ='edit Note';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F2F2F),
      appBar:appBarWidget(title: 'Edit Note', icon: Icon(Icons.check),),
      body: Padding(
        padding : EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(labelColor: Colors.lightBlueAccent, borderColor: Colors.grey, hintText: 'Enter the title', labelText: 'title'),
            SizedBox(height: 20,),
            CustomTextField(labelColor: Colors.lightBlueAccent, borderColor: Colors.grey, hintText: 'Enter the content', labelText: 'content',minLines: 5,),
          ],
        ),
      ),
    );
  }
}
