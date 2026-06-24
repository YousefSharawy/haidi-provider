
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'general/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DEMO MODE: render a blank placeholder instead of the red error screen if a
  // widget fails to build (e.g. unexpected null while the API is offline).
  ErrorWidget.builder = (FlutterErrorDetails details) => const SizedBox.shrink();
  await FlutterDownloader.initialize(debug: true);
  if (!kIsWeb) {
    try {
      await Firebase.initializeApp();
    } catch (_) {}
  }
  runApp(
    MultiBlocProvider(
      // create: (BuildContext context) => LangCubit(),
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<LangCubit>(
          create: (BuildContext context) => LangCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MyApp(isDark: themeState.isDark);
        },
      ),
    ),
  );
}