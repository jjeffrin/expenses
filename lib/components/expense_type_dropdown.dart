import 'package:expenses/models/expense_type_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExpenseTypeDropdown extends StatefulWidget {
  final void Function(ExpenseTypeModel?) onChanged;
  const ExpenseTypeDropdown({super.key, required this.onChanged});

  @override
  State<ExpenseTypeDropdown> createState() => _ExpenseTypeDropdownState();
}

class _ExpenseTypeDropdownState extends State<ExpenseTypeDropdown> {
  late Future<List<ExpenseTypeModel>> expenseTypes;

  Future<List<ExpenseTypeModel>> fetchExpenseTypes() async {
    var response = await http.get(
      Uri.parse(
        "https://expensetrackerapi-cwhwf4b6btd2fdey.centralindia-01.azurewebsites.net/api/expensetype",
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => ExpenseTypeModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  void initState() {
    super.initState();
    expenseTypes = fetchExpenseTypes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExpenseTypeModel>>(
      future: expenseTypes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No expense types available');
        }

        final expenseTypeData = snapshot.data!;
        return DropdownButtonFormField<ExpenseTypeModel>(
          decoration: InputDecoration(border: OutlineInputBorder()),
          hint: const Text("Select Category"),
          isExpanded: true,
          onChanged: (ExpenseTypeModel? newValue) {
            widget.onChanged(newValue);
          },
          items: expenseTypeData.map((ExpenseTypeModel category) {
            return DropdownMenuItem<ExpenseTypeModel>(
              value: category,
              child: Text(category.displayName ?? "Default"),
            );
          }).toList(),
        );
      },
    );
  }
}
