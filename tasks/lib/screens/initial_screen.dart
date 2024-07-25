import 'package:flutter/material.dart';
import 'package:tasks/components/task.dart';
import 'package:tasks/data/task_inherited.dart';
import 'package:tasks/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});


  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Tasks'),
        ),
        body: ListView(
          children: TaskInherited.of(context).taskList
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ),
            );
          },
          child: const Icon(Icons.add),
        )
    );
  }
}