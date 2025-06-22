import 'package:flutter/material.dart';

class DatePickerTextField extends StatefulWidget {
  final void Function(DateTime)? onDateSelected;

  const DatePickerTextField({super.key, this.onDateSelected});

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _controller = TextEditingController(text: 'Start');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _controller.text = "${picked.toLocal()}".split(' ')[0]; // Format as yyyy-MM-dd
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked); 
      }
    }
  }

  String? _validator(String? value) {
    // Check if the field is empty or still set to 'Start'
    if (value == null || value.isEmpty || value == 'Start') {
      return 'Please select a date';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              readOnly: true,
              validator: _validator, 
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
