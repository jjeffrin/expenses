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
                  setState(() { useCurrentTime = !useCurrentTime; });
                },
                title: Text("Use current time"),
              ),
              const SizedBox(height: 16.0),
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
