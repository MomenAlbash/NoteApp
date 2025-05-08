import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/widgets/AddNoteForm.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocProvider(
              create: (context) => AddNoteCubit(),
              child: BlocConsumer<AddNoteCubit, AddNoteState>(
                listener: (context, state) {
                  if(state is AddNoteSuccessState){
                    log('Success');
                    Navigator.pop(context);
                  }
                  if(state is AddNoteFailureState){
                    log("Failed ${state.errorMessage}");
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is AddNoteLoadingState ? true : false ,
                      child: AddNoteForm());
                },
              ),
            ),
          )),
    );
  }
}


