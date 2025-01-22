import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/icons/icons_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/fields/textfield_component.dart';
import '../../../_core/presentation/component/typography/typography.dart';

class AddTaskSheet extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final DateTime selectedDate;
  final Function(String title, String description, DateTime date) onAddTask;

  const AddTaskSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.selectedDate,
    required this.onAddTask,
  });

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(
      text: widget.selectedDate.toLocal().toString().split(' ')[0],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = pickedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.w,
        left: 16.w,
        right: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Slate.slate300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TypographyStyles.h6(
              'Tambahkan Task Baru',
              fontWeight: FontWeight.w700,
              color: Slate.slate900,
            ),
            SizedBox(height: 24.h),
            TextFieldComponent(
              hintText: 'Masukkan judul task',
              controller: widget.titleController,
            ),
            SizedBox(height: 16.h),
            TextFieldComponent(
              hintText: 'Masukkan deskripsi',
              maxLines: 6,
              controller: widget.descriptionController,
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: TextFieldComponent(
                isEnabled: false,
                hintText: 'Pilih waktu',
                controller: dateController,
                icon: ZoomTapAnimation(
                  onTap: () => _pickDate(context),
                  child: CustomIcons.calendarBold(color: Slate.slate800),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: ZoomTapAnimation(
                child: ElevatedButton(
                  onPressed: () {
                    final pickedDate = dateController.text.isNotEmpty
                        ? DateTime.parse(dateController.text)
                        : DateTime.now();
                    widget.onAddTask(
                      widget.titleController.text,
                      widget.descriptionController.text,
                      pickedDate,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: Brand.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  child: TypographyStyles.bodyCaptionBold(
                    'Tambahkan Tugas',
                    color: Slate.slate100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
