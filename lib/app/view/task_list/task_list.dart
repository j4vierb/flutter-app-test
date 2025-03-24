import 'package:flutter/material.dart';
import 'package:todos_app/app/view/components/h1_title.dart';
// import 'package:todos_app/app/view/components/onboarding.dart';
import 'package:todos_app/app/view/model/task.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Center(child: Text("Lista de tareas"))),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35),
            child: H1Title("Tareas", ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ListView.separated(
                itemBuilder: (_, index) => _TaskItem(taskList[index]),
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemCount: taskList.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("HOLA");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
        child: Row(
          children: [
            Icon(Icons.check_box_outline_blank, color: Colors.black),
            SizedBox(width: 10),
            Text(task.title, style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

final taskList = <Task>[
  Task("Estudiar para algo"),
  Task("Hacer algo"),
  Task("Comprar algo"),
  Task("Hacer algo más"),
];
