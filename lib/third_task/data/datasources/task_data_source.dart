import 'dart:developer';

import 'package:fikril_siesta_technical_test/_core/utils/service/database_service.dart';
import '../models/task_model.dart';

class TaskDataSource {
  final DatabaseService dbHelper;

  TaskDataSource(this.dbHelper);

  Future<void> addTask(Task task) async {
    final db = await dbHelper.database;
    await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> fetchTasks() async {
    final db = await dbHelper.database;
    final result = await db.query('tasks');
    return result.map((map) => Task.fromMap(map)).toList();
  }

  Future<void> updateTask(Task task) async {
    final db = await dbHelper.database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await dbHelper.database;
    log('Deleting from table: tasks', name: 'DeleteTask');
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
