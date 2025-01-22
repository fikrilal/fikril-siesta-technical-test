import '../../data/models/task_model.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> fetchTasks();
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);
}
