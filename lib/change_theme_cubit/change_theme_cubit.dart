import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/change_theme_cubit/change_theme_cubit.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(LightThemeState());
  getThemeApp({required bool isLigth}){
    if(isLigth){
      emit(LightThemeState());
    }else{
      emit(DarkThemeState());
    }
  }

}
