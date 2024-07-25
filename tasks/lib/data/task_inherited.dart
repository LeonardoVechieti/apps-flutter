import 'package:flutter/material.dart';

import '../components/task.dart';


class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Primeira Tarefa', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
    Task('Segunda Tarefa','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
    Task('Terceira Tarefa' ,'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
    Task('Quarta Tarefa','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
    Task('Quinta Tarefa','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1),
  ];

  void newTask(Task task) {
    taskList.add(task);
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
