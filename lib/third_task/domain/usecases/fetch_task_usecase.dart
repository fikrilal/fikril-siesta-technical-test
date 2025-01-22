import '../../data/models/task_model.dart';
import '../repositories/task_repository.dart';

class FetchTasksUseCase {
  final TaskRepository repository;

  FetchTasksUseCase(this.repository);

  Future<List<Task>> call() async {
    return await repository.fetchTasks();
  }
}
