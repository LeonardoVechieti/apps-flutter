import 'package:flutter/material.dart';
import 'package:tasks/components/task.dart';
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
          children:const [
            Task('Primeira Tarefa', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
            Task('Segunda Tarefa','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
            Task('Terceira Tarefa' ,'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
            Task('Quarta Tarefa','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
            Task('Quinta Tarefa','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1),
            SizedBox(height: 70,),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        )
    );
  }
}