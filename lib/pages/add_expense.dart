import 'package:expenses/components/expense_type_dropdown.dart';
import 'package:expenses/models/expense_type_model.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  late Future<List<ExpenseTypeModel>>? expenseTypes;
  ExpenseTypeModel? selectedExpenseType;
  bool useCurrentTime = true;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? selectedDateTime;

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2026),
    );
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log Expense")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ExpenseTypeDropdown(
                onChanged: (newValue) {
                  setState(() {
                    selectedExpenseType = newValue;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              SwitchListTile(
                value: useCurrentTime,
                onChanged: (newValue) {
                  setState(() {
                    useCurrentTime = !useCurrentTime;
                  });
                },
                title: Text("Use current date & time"),
              ),
              const SizedBox(height: 16.0),
              if (!useCurrentTime)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(                        
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hint: Text("Date & Time"),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectDate(context).then((selectedVal) {
                          if (selectedVal != null) {
                            setState(() {
                              selectedDate = selectedVal;
                              selectedDateTime = DateTime(
                                selectedVal.year,
                                selectedVal.month,
                                selectedVal.day,
                              );
                            });
                          }
                        });
                      },
                      icon: Icon(Icons.calendar_today),
                    ),
                    IconButton(                      
                      onPressed: () {
                        if (selectedDate == null) return;
                        _selectTime(context).then((selectedVal) {
                          if (selectedVal != null) {
                            setState(() {
                              selectedTime = selectedVal;
                            });
                          }
                        });
                      },
                      icon: Icon(Icons.access_time),
                    ),
                  ],
                ),
              if (!useCurrentTime) SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {
                  // Logic to save the expense
                },
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
