import 'package:flutter/material.dart';
import 'package:flutter_provider_task/provider/todo_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.push('/add');
        },
      ),
      appBar: AppBar(
        title: Text('ToDo'),
        actions: [
          IconButton(
              onPressed: () {
                context.push('/add');
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TaskProvider>().todo.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8),
            child: Card(
              elevation: 0,
              child: Row(
                children: [
                  Checkbox(
                      value:
                          context.watch<TaskProvider>().todo[index].isComplete,
                      onChanged: ((value) {
                        context.read<TaskProvider>().changeComplete(
                            context.read<TaskProvider>().todo[index]);
                      })),
                  Expanded(
                      child:
                          Text(context.watch<TaskProvider>().todo[index].task)),
                  if (context.watch<TaskProvider>().todo[index].isComplete)
                    IconButton(
                        //Enable delete button only if the task is completed
                        onPressed: context
                                    .watch<TaskProvider>()
                                    .todo[index]
                                    .isComplete ==
                                false
                            ? null
                            : () {
                                context.read<TaskProvider>().deleteTask(
                                    context.read<TaskProvider>().todo[index]);
                              },
                        icon: Icon(Icons.delete_outline))
                  else
                    IconButton(
                        //Enable delete button only if the task is completed
                        onPressed: null,
                        icon: Icon(Icons.delete_outline))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
