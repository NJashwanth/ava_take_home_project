import 'package:ava_take_home_project/views/home_screen.dart';
import 'package:ava_take_home_project/views/settings_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const HomeScreen(),
    '/settings/view': (context) => const SettingsScreen(false),
    '/settings/edit': (context) => const SettingsScreen(true),
  };
}
