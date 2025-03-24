import 'package:flutter/material.dart';
import 'package:todos_app/app/view/components/h1_title.dart';
import 'package:todos_app/app/view/components/shape.dart';
import 'package:todos_app/app/view/model/task.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Center(child: Text("Lista de tareas"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const _Header(), Expanded(child: const _TaskList())],
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
  const _TaskItem(this.task, {this.onTap});

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              task.done
                  ? Icon(Icons.check_box, color: Colors.black)
                  : Icon(Icons.check_box_outline_blank, color: Colors.black),
              SizedBox(width: 10),
              Text(
                task.title,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(children: const [Shape()]),
          Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/images/tasks-list-image.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 16),
              const H1Title('Completa tus tareas'),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskList extends StatefulWidget {
  const _TaskList();

  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final taskList = <Task>[
    Task("Estudiar para algo"),
    Task("Hacer algo"),
    Task("Comprar algo"),
    Task("Hacer algo más"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const H1Title("Tareas"),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemBuilder:
                  (_, index) => _TaskItem(
                    taskList[index],
                    onTap: () {
                      taskList[index].done = !taskList[index].done;
                      setState(() {});
                    },
                  ),
              separatorBuilder: (_, __) => SizedBox(height: 10),
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }
}
