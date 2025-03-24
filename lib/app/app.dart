import 'package:flutter/material.dart';
// import 'package:todos_app/app/view/splash/splash_page.dart';
import 'package:todos_app/app/view/task_list/task_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primary = Colors.white;
    const textColor = Colors.white;
    const backgroundColor = Colors.teal;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: textColor,
          fontFamily: 'Inter',
          displayColor: textColor,
        )
      ),
      home: TaskListPage(),
    );
  }
}