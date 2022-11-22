import 'package:flutter/material.dart';
import 'package:flutter_provider_task/provider/todo_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<TaskProvider>().addTask(controller.text);
                    context.pop();
                  },
                  child: Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}
