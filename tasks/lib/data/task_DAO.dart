 import 'dart:ffi';

import 'package:sqflite/sqflite.dart';

import '../components/task.dart';
import 'database.dart';

class TaskDAO {
   static const String tableSql = 'CREATE TABLE $_tablename('
       '$_id INTEGER PRIMARY KEY, '
       '$_name TEXT, '
       '$_difficulty INTEGER, '
       '$_image TEXT)';

   static const String _id = 'id';
   static const String _tablename = 'taskTable';
   static const String _name = 'name';
   static const String _difficulty = 'difficulty';
   static const String _image = 'image';

   // save(Task task) async {
   //   final Database db = await getDatabase();
   //   Map<String, dynamic> taskMap = _toMap(task);
   //   return db.insert(_tablename, taskMap);
   // }

   Future<List<Task>>findAll() async {
     final Database db = await getDatabase();
     final List<Map<String, dynamic>> result = await db.query(_tablename);
     List<Task> tasks = _toList(result);
     return tasks;
   }

    // Map<String, dynamic> _toMap(Task task) {
    //   final Map<String, dynamic> taskMap = Map();
    //   taskMap[_name] = task.name;
    //   taskMap[_difficulty] = task.difficulty;
    //   taskMap[_image] = task.image;
    //   return taskMap;
    // }

    List<Task> _toList(List<Map<String, dynamic>> result) {
      final List<Task> tasks = <Task>[];
      for (Map<String, dynamic> row in result) {
        final Task task = Task(
          row[_name],
          row[_image],
          row[_difficulty],
        );
        tasks.add(task);
      }
      return tasks;
    }

   findByName(String name) async {
     final Database db = await getDatabase();
     final List<Map<String, dynamic>> result = await db.query(_tablename, where: '$_name = ?', whereArgs: [name]);
     return _toList(result);
   }

   delete(int id) async {
     final Database db = await getDatabase();
     return db.delete(_tablename, where: 'id = ?', whereArgs: [id]);
   }
 }