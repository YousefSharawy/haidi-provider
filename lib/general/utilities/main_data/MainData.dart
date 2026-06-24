part of 'MainDataImports.dart';

class MainData {
  static String chatUrl = "https://harajawamer.ip4s.com/chatHub";

  static ThemeData defaultThem = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    appBarTheme: AppBarTheme(
      color: MyColors.primary,
    ),
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.cairo(fontSize: 14, color: Colors.black),
    ),
    splashColor: Colors.white,
  );

  static ThemeData darkThem = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.grey,
      focusColor: MyColors.white,
      primaryColor: Colors.black,
      primaryColorDark: Colors.black,
      appBarTheme: AppBarTheme(
        color: MyColors.primary,
      ),
      fontFamily: GoogleFonts.cairo().fontFamily,
      textTheme: TextTheme(
        titleMedium: GoogleFonts.cairo(fontSize: 14, color: Colors.white),
      ),
      splashColor: Colors.black);

  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
    BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),

      ];
}
