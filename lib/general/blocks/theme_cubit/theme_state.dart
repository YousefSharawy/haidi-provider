part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final bool isDark;
  const ThemeState(this.isDark);
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(false);

  @override
  List<Object> get props => [isDark];
}

class ThemeUpdated extends ThemeState {
  ThemeUpdated(bool isDark) : super(isDark);

  @override
  List<Object> get props => [isDark];
}
