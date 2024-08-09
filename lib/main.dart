// import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fullter/widget/GetxTodo.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // new == 객체를 새로 생성할 때 사용하는 키워드
    // return new MaterialApp(
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const GetTodo(),
      // home: const TodoList(),
      // home: const Counter(title: 'Flutter Demo Home Page'),
    );
  }
}
