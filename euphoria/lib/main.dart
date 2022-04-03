import 'package:euphoria/screens/home_screen.dart';
import 'package:euphoria/screens/sign_in_screen.dart';
import 'package:euphoria/screens/signup_screen.dart';
import 'package:euphoria/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  // the code below is used to initialize the firebase in the project
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Euphoria App',
      theme: ThemeData(
        primarySwatch: kAppPrimaryColor,
      ),
      // adding support for localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), 
      ],
      initialRoute: "/",
      routes: {
        "/": (context) => const SignInScreen(), // sign in route
        SignUpScreen.signupRoute: (context) =>
            const SignUpScreen(), // sign up route
        HomeScreen.homeScreenRoute: (context) =>
            const HomeScreen(), // home screen route
      },
    );
  }
}
