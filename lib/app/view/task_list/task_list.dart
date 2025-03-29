import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todos_app/app/view/components/h1_title.dart';
import 'package:todos_app/app/view/components/shape.dart';
import 'package:todos_app/app/view/model/task.dart';
import 'package:todos_app/app/view/task_list/task_provider.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..fetchTasks(),
      child: Scaffold(
        // appBar: AppBar(title: Center(child: Text("Lista de tareas"))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const _Header(), Expanded(child: _TaskList())],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _showNewTaskModal(context),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider.value(value: context.read<TaskProvider>(), child: _NewTaskModal()),
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  _NewTaskModal();

  final _titleController = TextEditingController();
  final _descrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          H1Title("Nueva tarea", color: Colors.black),
          SizedBox(height: 26),
          TextField(
            autofocus: true,
            controller: _titleController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: "Titulo de la tarea",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              /* errorText: (confirmPassword) */
            ),
          ),
          SizedBox(height: 13),
          TextField(
            autofocus: true,
            controller: _descrController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: "Descripción de la tarea",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 13),
          ElevatedButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty &&
                  _descrController.text.isNotEmpty) {
                final task = Task(_titleController.text, _descrController.text);
                context.read<TaskProvider>().addNewTask(task);
                Navigator.of(context).pop(task);
              }
            },
            child: Text("Guardar", style: TextStyle(color: Colors.white)),
          ),
        ],
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    task.description,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
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

class _TaskList extends StatelessWidget {
  const _TaskList();

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
            child: Consumer<TaskProvider>(
              builder: (_, provider, _) {
                if (provider.taskList.isEmpty) {
                  return Center(child: Text("No hay tareas"));
                }

                final taskList = provider.taskList;

                return ListView.separated(
                  itemBuilder:
                      (_, index) => _TaskItem(
                        taskList[index],
                        onTap: () => provider.onTaskDoneChange(taskList[index]),
                      ),
                  separatorBuilder: (_, __) => SizedBox(height: 10),
                  itemCount: taskList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
