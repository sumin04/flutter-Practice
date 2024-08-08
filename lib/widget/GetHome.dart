import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fullter/widget/todolist.dart';

class GetHome extends StatefulWidget {
  const GetHome({super.key});

  @override
  State<GetHome> createState() => _GetHomeState();
}

class _GetHomeState extends State<GetHome> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'getX route',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> const GetHome()),
        GetPage(name: '/Todo', page: ()=> const TodoList()),
      ],


      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Row(children: [
        ElevatedButton(
          onPressed: () {
            // Get.toNamed('/Todo', arguments: '오호라 이게 뭐시당가');
            Get.toNamed('/Todo');
          }, 
          child: const Text('TodoList투두투두투두두두')
        ),

        ElevatedButton(
          onPressed: () {
            // Get.toNamed('/GetTodo', arguments: '요리보고 저리봐도~');
            Get.toNamed('/GetTodo');
          }, 
          child: const Text('GetxTodo')
        ),
        
      ],)
    );
  }
}