import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

void showCalendar(BuildContext context) async {
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
        }
      });
    }
  });
}
