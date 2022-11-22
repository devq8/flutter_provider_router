import 'package:flutter/material.dart';
import 'package:flutter_provider_task/pages/add_task.dart';
import 'package:flutter_provider_task/pages/list.dart';
import 'package:flutter_provider_task/provider/todo_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: ((context, state) => ListPage()),
  ),
  GoRoute(
    path: '/add',
    builder: (context, state) => AddTask(),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
