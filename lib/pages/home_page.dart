import 'package:flutter/material.dart';
import 'package:to_do_list/pages/utilites/dialog_box.dart';
import 'package:to_do_list/pages/utilites/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of tasks
  List<Task> taskList = [
    Task(
        title: "Studying Flutter",
        description: "Complete the widget section",
        completed: false),
    Task(
        title: "Problem Solving ",
        description: "Finish arrays sheet deedline 10 feb 10pm",
        completed: false),
  ];

  // Controllers for task input
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // Checkbox tapped
  void checkedBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index].completed = value ?? false;
    });
  }

  // Create a new task
  void createANewTask(BuildContext context) {
    titleController.clear();
    descriptionController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          titleController: titleController,
          descriptionController: descriptionController, // Pass new controller
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Save a new task
  void saveNewTask() {
    if (titleController.text.isNotEmpty) {
      setState(() {
        taskList.add(Task(
          title: titleController.text,
          description: descriptionController.text, // Save description
          completed: false,
        ));
      });
      titleController.clear();
      descriptionController.clear();
      Navigator.of(context).pop();
    }
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        elevation: 0,
        title: const Center(
          child: Text(
            "T O   D O",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return Dismissible(
            key: Key(task.title),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) => deleteTask(index),
            child: ToDoTile(
              taskName: task.title,
              taskDescription: task.description, // Display description
              taskCompleted: task.completed,
              onChanged: (value) => checkedBoxChanged(value, index),
              deleteFunction: (BuildContext context) => deleteTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createANewTask(context),
        backgroundColor: Colors.deepOrange[200],
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Updated Task class with description
class Task {
  final String title;
  final String description;
  bool completed;

  Task({
    required this.title,
    this.description = '', // Default to empty if not provided
    required this.completed,
  });
}
