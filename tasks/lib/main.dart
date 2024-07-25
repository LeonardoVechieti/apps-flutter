import 'package:flutter/material.dart';
import 'package:tasks/data/task_inherited.dart';
import 'package:tasks/screens/form_screen.dart';
import 'package:tasks/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const FormScreen(),
      home: TaskInherited(
        child: const InitialScreen(),
      ),
    );
  }
}