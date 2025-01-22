import '../../domain/repositories/task_repository.dart';
import '../datasources/task_data_source.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<void> addTask(Task task) async {
    await dataSource.addTask(task);
  }
  @override
  Future<List<Task>> fetchTasks() async {
    return await dataSource.fetchTasks();
  }

  @override
  Future<void> updateTask(Task task) async {
    await dataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(int id) async {
    await dataSource.deleteTask(id);
  }
}