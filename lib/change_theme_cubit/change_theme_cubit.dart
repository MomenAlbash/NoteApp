import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(IntialState());

  static ChangeThemeCubit get(context) => BlocProvider.of(context);

  bool isDark=false;

  chnageModeApp(){
    isDark=!isDark;
    emit(ChangeModeState());
  }



}
