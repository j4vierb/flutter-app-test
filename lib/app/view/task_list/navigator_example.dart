import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

/* leading: GestureDetector(
  onTap: () {
    Navigator.of(context).pop();
  },
  child: Center(child: Text("Atrás", style: TextStyle(fontSize: 20),))
), */
class _TaskListPageState extends State<TaskListPage> {
  int counter = 0;

  // this is executed before the build method
  @override
  void initState() {
    super.initState();
  }

  // this is executed when the widget is removed from
  // the widget tree
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de tareas")),
      body: Center(child: Text("Hola desde un widget sin estado: $counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // anonymous function
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
