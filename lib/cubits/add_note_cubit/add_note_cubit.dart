import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
}
