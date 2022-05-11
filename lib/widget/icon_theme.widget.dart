import 'package:animation_flutter/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconThemeWidget extends StatelessWidget {
  const IconThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) {
      ThemeCubit themeCubit = context.read<ThemeCubit>();

      return IconButton(
        onPressed: () {
          if (state.brightness == Brightness.dark) {
            themeCubit.changeLight();
          } else {
            themeCubit.changeDark();
          }
        },
        icon: Icon(
          state.brightness == Brightness.dark
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
      );
    });
  }
}
