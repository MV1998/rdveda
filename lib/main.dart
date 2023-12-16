import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdveda/src/feature/home/screens/home_screen.dart';
import 'src/feature/authentication/screens/login.dart';
import 'src/feature/authentication/screens/registration.dart';
import 'src/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

  class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late GoRouter goRouter;

  @override
  void initState() {
    goRouter = GoRouter(
      routes: [
        GoRoute(
          name: "splash",
          path: "/",
          pageBuilder: (context, state) {
            return const MaterialPage(child: Splash());
          }
        ),
        GoRoute(
            name: "login",
            path: "/login",
            pageBuilder: (context, state) {
              return const MaterialPage(child: Login());
            }
        ),
        GoRoute(
            name: "register",
            path: "/register",
            pageBuilder: (context, state) {
              return const MaterialPage(child: Registration());
            }
        ),
        GoRoute(
            name: "home",
            path: "/home",
            pageBuilder: (context, state) {
              return const MaterialPage(child: HomeScreen());
            }
        ),
      ],
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.lightGreen.shade900,
        primaryTextTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white)
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
          bodySmall: TextStyle(fontSize: 16, color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
          )
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade700,
          // backgroundColor: Colors.white,
          elevation: 0.0,
        )
      ),
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}