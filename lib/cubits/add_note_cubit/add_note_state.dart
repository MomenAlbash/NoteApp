part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState{}

class AddNoteFailureState extends AddNoteState{
  final String errorMessage;

  AddNoteFailureState(this.errorMessage);

}

class AddNoteSuccessState extends AddNoteState{}
