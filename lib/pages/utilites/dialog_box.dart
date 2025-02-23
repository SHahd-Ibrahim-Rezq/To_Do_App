import 'package:flutter/material.dart';
import 'package:to_do_list/pages/utilites/buttons.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController; // New controller
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.titleController,
    required this.descriptionController, // Add this
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 183, 161),
      content: SizedBox(
        height: 220, // Increased height for extra field
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Task Title Field
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Add a new task title',
                filled: true,
                fillColor: Colors.white,
              ),
              autofocus: true,
            ),

            const SizedBox(height: 10), // Spacing between fields

            // Task Description Field
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Add a task description (optional)',
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(
                  buttonName: 'Save',
                  onPressed: onSave,
                  backgroundColor: Colors.deepOrange[200],
                  textColor: Colors.black,
                ),
                const SizedBox(width: 10),
                MyButtons(
                  buttonName: 'Cancel',
                  onPressed: onCancel,
                  backgroundColor: Colors.grey[300],
                  textColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
