import 'package:flutter/material.dart';
import 'package:todo_simple/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // create list todo
  List todoList = [
    ['reading book ', false],
    ['listening music  ', false],
  ];

  // function onChange task
  void onChangeTask(bool? value, index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 180,
              width: 250,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text('TO DO APP '),
          actions: [
            GestureDetector(onTap: createNewTask, child: const Icon(Icons.add)),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ToDoItem(
                  isCompleted: todoList[index][1],
                  taskName: todoList[index][0],
                  onChanged: (value) => onChangeTask(value, index));
            }));
  }
}
