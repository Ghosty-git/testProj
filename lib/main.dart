// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

bool iconBool = false;

IconData iconLight = Icons.wb_sunny_outlined;
IconData iconDark = Icons.nightlight_round_sharp;

ThemeData lightMode =
    ThemeData(primarySwatch: Colors.lightGreen, brightness: Brightness.light);

ThemeData darkMode =
    ThemeData(primarySwatch: Colors.blueGrey, brightness: Brightness.dark);

String hello = "Hello World";
String bye = "Bye World";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<DateModel> dateModelList = [
  DateModel(
    description: 'Вы последний раз нажимали в :',
    currentDate: DateTime.now(),
  ),
];

// var now = new DateTime.now();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: iconBool ? darkMode : lightMode,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Light & Dark Theme"),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  iconBool = !iconBool;
                });
              },
              icon: Icon(iconBool ? iconDark : iconLight),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  dateModelList.add(
                    DateModel(
                      description: 'Вы последний раз нажимали в :',
                      currentDate: DateTime.now(),
                    ),
                  );
                  setState(() {
                    iconBool = !iconBool;
                  });
                },
                child: Text(iconBool ? bye : hello),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: dateModelList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dateModelList[index].description),
                          Text(dateFormatter(dateModelList[index].currentDate)),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateModel {
  final String description;
  final DateTime currentDate;

  DateModel({
    required this.description,
    required this.currentDate,
  });
}

String dateFormatter(now) {
  var formatter = new DateFormat('yyyy-MM-dd, : HH:mm(s)');
  String formattedDate = formatter.format(now);

  return formattedDate;
}
