
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static AddNoteCubit get(context)=> BlocProvider.of(context);
  addNote(NoteModel noteModel){
    emit(AddNoteLoadingState());
    try{
      var noteBox=Hive.box<NoteModel>(kNotesBox);
      noteBox.add(noteModel);

      emit(AddNoteSuccessState());
    }catch(error){
      emit(AddNoteFailureState(error.toString()));
    }
  }
}
