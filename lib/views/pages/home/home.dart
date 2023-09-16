import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:trashfix/views/widgets/custom_card_widgets/custom_card_widget.dart';
import 'package:trashfix/views/widgets/custom_drawer/custom_drawer.dart';
import 'package:trashfix/views/widgets/custom_titles/custom_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar2,
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomCard(
            text: "Recycle 5 items today",
            onPressed: () {
              Get.to(() => TaskPage(taskName: "Recycle 5 items today"));
            },
          ),
          CustomCard(
            text: "Go meatless for a meal.",
            onPressed: () {
              Get.to(() => TaskPage(taskName: "Go meatless for a meal."));
            },
          ),
          CustomCard(
            text: "Reduce Water Waste Today",
            onPressed: () {
              Get.to(() => TaskPage(taskName: "Reduce Water Waste Today"));
            },
          ),
          CustomCard(
            text: "Buy Local, Support Sustainability",
            onPressed: () {
              Get.to(() =>
                  TaskPage(taskName: "Buy Local, Support Sustainability"));
            },
          ),
        ],
      ),
    );
  }
}

class TaskPage extends StatefulWidget {
  String taskName;
  TaskPage({super.key, required this.taskName});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isTaskStarted = false;
  bool isTaskCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.taskName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSizes.height10 * 4),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isTaskStarted = true;
                });
              },
              child: const Text('Start Task'),
            ),
            SizedBox(height: AppSizes.height10 * 2),
            if (isTaskStarted && !isTaskCompleted)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isTaskCompleted = true;
                  });
                  _showCongratulationsDialog(context);
                },
                child: const Text('Complete Task'),
              ),
          ],
        ),
      ),
    );
  }

  void _showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You have completed the task.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
