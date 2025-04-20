import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/change_theme_cubit/change_theme_cubit.dart';
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
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        final isLight = state is LightThemeState;
        return Scaffold(
          appBar: appBarWidget(
            title: 'Notes',
            icon: Icon(Icons.search),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ShowModelButtomSheet(context);
            },
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Switch(value: isLight, onChanged: (val) {
                  var GetWeatherCubit = BlocProvider.of<ChangeThemeCubit>(
                      context);
                  GetWeatherCubit.getThemeApp(isLigth: val);
                }),
              ],
            ),
          ),
          body: ValueListenableBuilder(
              valueListenable: Hive.box<Note>('notes').listenable(),
              builder: (context, Box<Note> box, _) {
                if (box.isEmpty) {
                  return Center(child: Text('لا توجد ملاحظات'));
                }
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return CustomContainerWidget();
                  },
                );
              }),
        );
      },
    );
  }

  void ShowModelButtomSheet(BuildContext context) {
    showModalBottomSheet(
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
              )),
        );
      },
    );
  }
}
