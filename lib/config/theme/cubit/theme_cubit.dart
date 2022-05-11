import 'package:animation_flutter/config/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(themes[THEME.dark]!);

  void changeLight() {
    print("CHange light");
    emit(themes[THEME.light]!);
  }

  void changeDark() {
    print("CHange dark");
    emit(themes[THEME.dark]!);
  }
}
