import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/screens/splash/splash_screen.dart';
import 'package:todo_list_app/theme/app_decoration.dart';

final searchProvider = StateProvider.autoDispose((ref) => "");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("en", "us"),
      builder: (context, navigator) {
        final scale = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.25);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: Theme(
              data: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Color(
                  0xff5F78FC,
                )),
                inputDecorationTheme: AppDecoration.textFieldDecoration,
                fontFamily: 'Cairo',
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700, height: 1.2),
                ),
              ),
              child: navigator!,
            ));
      },
      home: const SplashScreen(),
    );
  }
}
