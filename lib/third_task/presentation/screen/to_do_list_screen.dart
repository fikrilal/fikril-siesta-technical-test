import 'dart:developer';
import 'package:fikril_siesta_technical_test/third_task/presentation/component/action_sheet.dart';
import 'package:fikril_siesta_technical_test/third_task/presentation/component/task_card_skeleton.dart';
import 'package:get/get.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/icons/icons_library.dart';
import 'package:fikril_siesta_technical_test/third_task/presentation/component/date_list_filter.dart';
import 'package:fikril_siesta_technical_test/third_task/presentation/component/task_card.dart';
import 'package:fikril_siesta_technical_test/third_task/presentation/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';
import '../component/add_task_sheet.dart';
import '../component/edit_task_sheet.dart';
import '../component/filter_sheet.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TaskController taskController = Get.find<TaskController>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskController.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TypographyStyles.h5(
          'Task This Month',
          color: Slate.slate900,
        ),
        actions: [
          ZoomTapAnimation(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                ),
                builder: (context) => FilterSheet(
                  onShowAll: () {
                    taskController.setFilter('All');
                    Navigator.pop(context);
                  },
                  onShowCompleted: () {
                    taskController.setFilter('Completed');
                    Navigator.pop(context);
                  },
                  onShowPending: () {
                    taskController.setFilter('Pending');
                    Navigator.pop(context);
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Slate.slate100,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: CustomIcons.filterBold(
                size: 20,
                color: Slate.slate900,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateListFilter(
                initialDate: DateTime.now(),
                onDateSelected: (selectedDate) {
                  log('Selected Date: $selectedDate', name: 'DateListFilter');
                  taskController.setSelectedDate(selectedDate);
                },
              ),
              SizedBox(height: 32.h),
              TypographyStyles.bodyMainBold(
                'Your tasks today',
                color: Slate.slate900,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Obx(() {
                  if (taskController.isLoading.value) {
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: const TaskCardSkeleton(),
                        );
                      },
                    );
                  }

                  if (taskController.filteredTasks.isEmpty) {
                    return Center(
                      child: _buildEmptyState(),
                    );
                  }

                  return ListView.builder(
                    itemCount: taskController.filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = taskController.filteredTasks[index];
                      return Column(
                        children: [
                          TaskCard(
                            onTap: () {
                              taskController.toggleTaskStatus(task.id!, task.isCompleted);
                            },
                            onLongPress: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                                ),
                                builder: (context) {
                                  return ActionSheet(
                                    onEdit: () {
                                      Navigator.pop(context);
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.white,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                                        ),
                                        builder: (context) {
                                          titleController.text = task.title;
                                          descriptionController.text = task.description;
                                          return EditTaskSheet(
                                            titleController: titleController,
                                            descriptionController: descriptionController,
                                            selectedDate: task.date,
                                            onUpdateTask: (title, description, date) async {
                                              if (title.trim().isEmpty || description.trim().isEmpty) {
                                                Get.snackbar(
                                                  'Error',
                                                  'Title and description cannot be empty!',
                                                  snackPosition: SnackPosition.TOP,
                                                );
                                                return;
                                              }
                                              Navigator.pop(context);
                                              await taskController.updateTask(
                                                task.id!,
                                                title,
                                                description,
                                                task.isCompleted,
                                                date,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    onDelete: () async {
                                      Navigator.pop(context);
                                      await taskController.deleteTask(task.id!);
                                    },
                                  );
                                },
                              );
                            },
                            title: task.title,
                            description: task.description,
                            status: task.isCompleted,
                          ),
                          SizedBox(height: 8.h),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleController.clear();
          descriptionController.clear();
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) => AddTaskSheet(
              titleController: titleController,
              descriptionController: descriptionController,
              selectedDate: DateTime.now(),
              onAddTask: (title, description, date) async {
                log('Title Input: $title', name: 'AddTask');
                log('Description Input: $description', name: 'AddTask');
                log('Selected Date: $date', name: 'AddTask');
                if (title.isNotEmpty && description.isNotEmpty) {
                  await taskController.addTask(title, description, date);
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                } else {
                  Get.snackbar(
                    'Error',
                    'Judul dan deskripsi belum diisi!',
                    snackPosition: SnackPosition.TOP,
                  );
                }
              },
            ),
          );
        },
        backgroundColor: Brand.secondary,
        elevation: 4,
        child: CustomIcons.addBold(
          color: Colors.white,
          size: 16.w,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIcons.sadBold(color: Slate.slate800),
        SizedBox(height: 8.h),
        TypographyStyles.bodyMainRegular(
          'No task available',
          color: Slate.slate600,
        ),
      ],
    );
  }
}
