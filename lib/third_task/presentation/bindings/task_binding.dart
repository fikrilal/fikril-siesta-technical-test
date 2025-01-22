import 'package:fikril_siesta_technical_test/_core/utils/service/database_service.dart';
import 'package:fikril_siesta_technical_test/third_task/domain/usecases/delete_task_usecase.dart';
import 'package:fikril_siesta_technical_test/third_task/domain/usecases/fetch_task_usecase.dart';
import 'package:fikril_siesta_technical_test/third_task/domain/usecases/update_task_usecase.dart';
import 'package:get/get.dart';
import '../../data/datasources/task_data_source.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../controller/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    final databaseHelper = DatabaseService.instance;
    final taskDataSource = TaskDataSource(databaseHelper);
    final taskRepository = TaskRepositoryImpl(taskDataSource);
    final addTaskUseCase = AddTaskUseCase(taskRepository);
    final fetchTaskUseCase = FetchTasksUseCase(taskRepository);
    final updateTaskUseCase = UpdateTaskUseCase(taskRepository);
    final deleteTaskUseCase = DeleteTaskUseCase(taskRepository);
    Get.lazyPut<TaskController>(
      () => TaskController(
        addTaskUseCase: addTaskUseCase,
        fetchTasksUseCase: fetchTaskUseCase,
        updateTaskUseCase: updateTaskUseCase,
        deleteTaskUseCase: deleteTaskUseCase,
      ),
    );
  }
}
