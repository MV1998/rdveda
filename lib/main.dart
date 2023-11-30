import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'src/feature/authentication/screens/login.dart';
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
        // GoRoute(
        //     name: "home",
        //     path: "/home",
        //     pageBuilder: (context, state) {
        //       return const MaterialPage(child: Home());
        //     }
        // ),
        // GoRoute(
        //     name: "profile",
        //     path: "/profile",
        //     pageBuilder: (context, state) {
        //       return const MaterialPage(child: Profile());
        //     }
        // ),
        // GoRoute(
        //     name: "contact",
        //     path: "/contact",
        //     pageBuilder: (context, state) {
        //       return const MaterialPage(child: Contact());
        //     }
        // ),
        GoRoute(
            name: "login",
            path: "/login",
            pageBuilder: (context, state) {
              return const MaterialPage(child: Login());
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
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.lightGreen,
        primaryTextTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white)
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24, color: Colors.black),
            bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
          bodySmall: TextStyle(fontSize: 14, color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
          )
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
        )
      ),
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}