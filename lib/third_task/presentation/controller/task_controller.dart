import 'package:fikril_siesta_technical_test/third_task/domain/usecases/delete_task_usecase.dart';
import 'package:fikril_siesta_technical_test/third_task/domain/usecases/update_task_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../data/models/task_model.dart';
import '../../domain/usecases/fetch_task_usecase.dart';

class TaskController extends GetxController {
  final AddTaskUseCase addTaskUseCase;
  final FetchTasksUseCase fetchTasksUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;

  TaskController({
    required this.addTaskUseCase,
    required this.fetchTasksUseCase,
    required this.updateTaskUseCase,
    required this.deleteTaskUseCase,
  });

  var tasks = <Task>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var filteredTasks = <Task>[].obs;
  var filterStatus = 'All'.obs;
  var selectedDate = DateTime.now().obs;

  Future<void> addTask(String title, String description, DateTime date) async {
    try {
      final task = Task(
        title: title,
        description: description,
        isCompleted: false,
        date: date,
      );

      await addTaskUseCase(task);
      tasks.add(task);
      applyFilters();
      Get.snackbar('Success', 'Task added successfully');
      await fetchTasks();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add task: $e');
    }
  }

  Future<void> fetchTasks({bool onRefresh = false}) async {
    try {
      if (onRefresh) {
        isRefreshing.value = true;
      } else {
        isLoading.value = true;
      }

      final result = await fetchTasksUseCase();
      tasks.assignAll(result);
      applyFilters();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch tasks: $e');
    } finally {
      if (onRefresh) {
        isRefreshing.value = false;
      } else {
        isLoading.value = false;
      }
    }
  }

  Future<void> updateTask(int id, String title, String description, bool isCompleted, DateTime date) async {
    try {
      final taskIndex = tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        final updatedTask = Task(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          date: date,
        );

        await updateTaskUseCase(updatedTask);

        tasks[taskIndex] = updatedTask;
        applyFilters();
        Get.snackbar('Success', 'Task updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task: $e');
    }
  }

  Future<void> toggleTaskStatus(int id, bool currentStatus) async {
    try {
      final taskIndex = tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        final updatedTask = tasks[taskIndex].copyWith(isCompleted: !currentStatus);

        await updateTaskUseCase(updatedTask);

        tasks[taskIndex] = updatedTask;
        applyFilters();
        Get.snackbar(
          'Success',
          'Task status updated to ${updatedTask.isCompleted ? "Completed" : "Incomplete"}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task status: $e');
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await deleteTaskUseCase(id);

      tasks.removeWhere((task) => task.id == id);
      applyFilters();
      Get.snackbar('Success', 'Task deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete task: $e');
    }
  }

  void applyFilters() {
    var filtered = tasks;

    filtered = filtered
        .where((task) {
          return task.date.year == selectedDate.value.year &&
              task.date.month == selectedDate.value.month &&
              task.date.day == selectedDate.value.day;
        })
        .toList()
        .obs;

    if (filterStatus.value == 'Completed') {
      filtered = filtered.where((task) => task.isCompleted).toList().obs;
    } else if (filterStatus.value == 'Pending') {
      filtered = filtered.where((task) => !task.isCompleted).toList().obs;
    }

    filteredTasks.assignAll(filtered);
  }

  void setFilter(String status) {
    filterStatus.value = status;
    applyFilters();
  }

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
    applyFilters();
  }
}
