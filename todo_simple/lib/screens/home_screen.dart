import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_simple/database/todo_database.dart';
import 'package:todo_simple/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // open box data
  final myBox = Hive.box('myBox');

  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if (myBox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // text editing controller
  final _createNewTaskController = TextEditingController();

  // function onChange task
  void onChangeTask(bool? value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blue[200],
            content: SizedBox(
              height: 150,
              width: 250,
              child: Column(
                children: [
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _createNewTaskController,
                    decoration: InputDecoration(
                        hintText: "Write something ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  // end text filed
                  const SizedBox(
                    height: 20,
                  ),
                  // create button save and cancel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // button save
                      GestureDetector(
                        onTap: () {
                          // get name task add list
                          setState(() {
                            db.toDoList
                                .add([_createNewTaskController.text, false]);
                            _createNewTaskController.clear();
                            Navigator.of(context).pop();
                          });
                          db.updateData();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.yellow),
                          child: const Text("Save"),
                        ),
                      ),

                      // button cancel
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red),
                          child: const Text("Cancel "),
                        ),
                      )
                    ],
                  )
                ],
              ),
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
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoItem(
                  onDelete: (context) {
                    setState(() {
                      db.toDoList.removeAt(index);
                    });
                    db.updateData();
                  },
                  isCompleted: db.toDoList[index][1],
                  taskName: db.toDoList[index][0],
                  onChanged: (value) => onChangeTask(value, index));
            }));
  }
}
