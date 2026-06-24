import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  onUpdateTheme(bool isDark) {
    emit(ThemeUpdated(isDark));
  }

  changeAppTheme(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? initTheme = prefs.getBool("dark") ?? false;
    Utils.changeAppTheme(context, initTheme: initTheme);
  }
}
