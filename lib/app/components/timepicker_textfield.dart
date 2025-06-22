import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimePickerTextfield extends StatefulWidget {
  final void Function(TimeOfDay)? onTimeSelected;

  const TimePickerTextfield({
    super.key,
    this.onTimeSelected,
  });

  @override
  _TimePickerTextfieldState createState() => _TimePickerTextfieldState();
}

class _TimePickerTextfieldState extends State<TimePickerTextfield> {
  final TextEditingController _controller = TextEditingController();

  // Helper to parse time from text
  TimeOfDay? _parseTime(String input) {
    try {
      final parts = input.split(':');
      if (parts.length != 2) return null;
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;
      return TimeOfDay(hour: hour, minute: minute);
    } catch (_) {
      return null;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: _parseTime(_controller.text) ?? now,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _controller.text = picked.format(context);
      });
      if (widget.onTimeSelected != null) {
        widget.onTimeSelected!(picked);
      }
    }
  }

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Column( 
      crossAxisAlignment: CrossAxisAlignment.stretch, 
      children: [
        TextFormField(
          controller: _controller,
          keyboardType: TextInputType.datetime,
          readOnly: true,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[0-9:]*$')),
            LengthLimitingTextInputFormatter(5),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'HH:mm',
            suffixIcon: IconButton(
              icon: Icon(Icons.timer),
              onPressed: () => _selectTime(context),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Enter time';
            if (_parseTime(value) == null) return 'Invalid time (HH:mm)';
            return null;
          },
          onChanged: (value) {
            final time = _parseTime(value);
            if (time != null && widget.onTimeSelected != null) {
              widget.onTimeSelected!(time);
            }
          },
        ),
      ],
    ),
  );
}
}