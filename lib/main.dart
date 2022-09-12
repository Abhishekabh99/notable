import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notable/utilities/constants.dart';

import 'models/note.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // this ensures that the engine is initialized before calling hive.initFlutter.
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Notable();
  }
}

class Notable extends StatelessWidget {
  const Notable({super.key});

// Future<void> example() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('key','vlaue');
//   String?
// }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notable',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kDarkGrey,
          centerTitle: false,
          elevation: 0,
        ),
        scaffoldBackgroundColor: kDarkGrey,
      ),
      home: FutureBuilder(
        future: Hive.openBox('notes'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("An error occured"),
              );
            }
            return HomeScreen();
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: kYellowColor,
              ),
            );
          }
        },
      ),
    );
  }
}
