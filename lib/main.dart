import 'package:expenses/pages/add_expense.dart';
import 'package:flutter/material.dart';
import 'util.dart';
import 'theme.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Inter", "Inter");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const DashboardPage(),
      localizationsDelegates: const [MonthYearPickerLocalizations.delegate],
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("expenses.")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpensePage()),
          );
        },
        label: Text("Log Expense"),
        icon: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Month / Year Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "June 2025",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Selected Month/Year"),
                    ],
                  ),
                  FilledButton(
                    onPressed: () async {
                      await showMonthYearPicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime(2026),
                      );
                    },
                    child: Text("Change"),
                  ),
                ],
              ),

              // Stats
              Card.filled(
                color: Theme.of(context).colorScheme.secondaryContainer,
                margin: EdgeInsets.only(top: 16.0),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Monthly Fund Stats",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text('\u{20B9} '"84,293.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("Remaining Usable (Usable - Expenses - Recurring)"),
                      SizedBox(height: 8.0),
                      Text('\u{20B9} '"1,08,242.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("Usable (Usable - Recurring)"),
                      SizedBox(height: 8.0),
                      Text('\u{20B9} '"1,47,200.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("Total (Income)")
                    ],
                  ),
                ),
              ),

              // Container
            ],
          ),
        ),
      ),
    );
  }
}
