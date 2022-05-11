import 'package:animation_flutter/config/theme/theme.dart';
import 'package:animation_flutter/module/tween/screens/tween.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: _build,
      ),
    );
  }

  Widget _build(BuildContext context, ThemeData state) {
    return MaterialApp(
      theme: state,
      title: 'Application',
      debugShowCheckedModeBanner: false,
      home: const TweenScreen(),
    );
  }
}
