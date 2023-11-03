import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/to_do_item_provider.dart';
import 'package:todo_app/utils/app_colors.dart';

import 'views/screens/home/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ToDoItemProvider())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(fontFamily: 'Roboto', primarySwatch: AppColors.mcolor),
      home: const HomePage(),
    );
  }
}
