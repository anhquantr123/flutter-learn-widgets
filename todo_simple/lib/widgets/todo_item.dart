import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem(
      {super.key,
      required this.isCompleted,
      required this.taskName,
      required this.onChanged,
      required this.onDelete});

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
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
        ),
      ),
    );
  }
}
