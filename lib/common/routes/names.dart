
import 'package:medik/pages/applications/applications_page.dart';
import 'package:medik/pages/home/homepage.dart';
import 'package:medik/pages/profile/settings/settings_page.dart';
import 'package:medik/pages/register/register.dart';
import 'package:medik/pages/sign_in/sign_in_screen.dart';
import 'package:medik/pages/welcome/welcome_screen.dart';

class AppRoutes{

  static const initial = WelcomeScreen.route;

  static const application = ApplicationPage.id;

  static const signIn = SignInScreen.route;

  static const register = Register.id;

  static const homepage = HomePageScreen.route;

  static const settingsPage = SettingsPage.route;

}