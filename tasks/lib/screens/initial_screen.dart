import 'package:flutter/material.dart';
import 'package:tasks/data/task_DAO.dart';
import 'package:tasks/data/task_inherited.dart';
import 'package:tasks/screens/form_screen.dart';

import '../components/task.dart';

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
          leading: Container(),
          actions: [
            IconButton(onPressed: (){setState(() {});}, icon: Icon(Icons.refresh)),
          ],
          title: const Text('Tasks'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 70),
          child: FutureBuilder<List<Task>>(
            future: TaskDAO().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando tarefas...'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando tarefas...'),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando tarefas...'),
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items!= null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemCount: items!.length,
                        itemBuilder: (context, index) {
                          return Task(
                            items[index].nome,
                            items[index].foto,
                            items[index].dificuldade,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              size: 100,
                              color: Colors.red,
                            ),
                            Text(
                              'Nenhuma tarefa cadastrada',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      );
                    }
                  }
                  break;
              }
              return const Center(
                child: Text('Erro ao carregar as tarefas'),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ),
            ).then((value) => setState(() {
              // ignore: avoid_print
              print('Atualizando a tela');
            }));

          },
          child: const Icon(Icons.add),
        )
    );
  }
}