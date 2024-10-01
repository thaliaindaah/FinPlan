import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/res/app_context_extension.dart';
import 'package:test_drive/views/dashboard/main_screen.dart';
import 'package:test_drive/views/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCMUvz9THF70XaSzN_7iz5_A_KNiBqB63g', 
      appId: '1:1006846405643:ios:22358ba4429b81a3936b0e', 
      messagingSenderId: '1006846405643', 
      projectId: 'finplan-bd278')
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: context.resources.color.primaryColor).copyWith(secondary: context.resources.color.accentColor)
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id : (context) => const SplashScreen(),
        MainScreen.id : (context) => const MainScreen(),
      },
    );
  }
}