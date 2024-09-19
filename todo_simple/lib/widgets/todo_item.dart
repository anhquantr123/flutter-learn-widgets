import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem(
      {super.key,
      required this.isCompleted,
      required this.taskName,
      required this.onChanged});

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            taskName,
            style: TextStyle(
                color: isCompleted ? Colors.red : Colors.black,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          Checkbox(value: isCompleted, onChanged: onChanged)
        ],
      ),
    );
  }
}
