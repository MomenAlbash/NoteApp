import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/widgets/CustomMaterialWidgets.dart';
import 'package:noteapp/widgets/CustomTextFileldWidget.dart';

import '../widgets/ButtomSheetBody.dart';
import '../widgets/CustomConatainerWidgets.dart';
import '../widgets/appBarWidgetr.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  static String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F2F2F),
      appBar: appBarWidget(title: 'Notes', icon: Icon(Icons.search),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowModelButtomSheet(context);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Note>('notes').listenable(),
          builder: (context, Box<Note> box, _) {
            if (box.isEmpty) {
              return Center(child: Text('لا توجد ملاحظات'));
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder:(context, index) {
                return CustomContainerWidget();
              },
              );
          }
      ),
    );
  }

  void ShowModelButtomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color(0xFF2F2F2F),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: ButtomSheetBody(),
                ),
              )
          ),
        );
      },
    );
  }
}


