import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:trashfix/views/widgets/custom_drawer/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _controller = Get.find();
  List<Task> tasks = [
    Task(title: 'Recycle 5 items today'),
    Task(title: 'Go meatless for a meal.'),
    Task(title: 'Recycle 5 items today'),
    Task(title: 'Go meatless for a meal.'),
  ];

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar2,
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2, // Customize card elevation as needed
            margin: EdgeInsets.symmetric(
                vertical: 8, horizontal: 16), // Adjust card margins
            child: ListTile(
              title: Text(tasks[index].title),
              trailing: Checkbox(
                value: tasks[index].isCompleted,
                onChanged: (value) {
                  setState(() {
                    tasks[index].isCompleted = value!;
                  });
                  if (value!) {
                    _showCongratulations(context);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCongratulations(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You completed a task.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}
