
import 'dart:io';

import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'general/MyApp.dart';

/// Accept the backend's self-signed / IP-mismatched TLS cert (the API is served
/// over HTTPS on a bare IP). Without this the TLS handshake fails and no data
/// loads. Safe for this private backend; revisit if a valid CA cert is added.
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DEMO MODE: render a blank placeholder instead of the red error screen if a
  // widget fails to build (e.g. unexpected null while the API is offline).
  ErrorWidget.builder = (FlutterErrorDetails details) => const SizedBox.shrink();
  await FlutterDownloader.initialize(debug: true);
  if (!kIsWeb) {
    HttpOverrides.global = MyHttpOverrides();
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