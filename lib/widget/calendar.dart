import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'task_priority.dart';

void showCalendar(
    BuildContext context,
    void Function(DateTime) handleDateTimeSelected,
    handlePriority,
    handleCategoryName) async {
  DateTime today = DateTime.now();
  showDatePickerDialog(
    context: context,
    initialDate: today,
    maxDate: DateTime(2101),
    minDate: DateTime(1900),
  ).then((selectedDate) {
    if (selectedDate != null) {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((selectedTime) {
        if (selectedTime != null) {
          DateTime selectedDateTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
          print(selectedDateTime);
          if (selectedDateTime != null) {
            handleDateTimeSelected(selectedDateTime);
            showTaskPriority(context, handlePriority, handleCategoryName);
          }
        }
      });
    }
  });
}
