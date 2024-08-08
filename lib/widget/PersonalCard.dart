import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  final person = Person().obs;
  void updateInfo(){
    person.update((val){
      val?.age++;
      val?.name = '눙뉸ㅇ냥뉸욘ㅇ';
    });
  }
}

class Person{
  Person({this.age = 0, this.name = ''});
  int age;
  String name;
}

class Personalcard extends StatelessWidget {
  Personalcard({super.key});
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 68, 77, 76)
              ),
              child: Center(
                child: GetX<Controller>(builder: (_) => Text(
                  'asd:${controller.person().name}',
                  style: const TextStyle(fontSize: 20, color: Colors.white)
                  ),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 0, 0, 0)
              ),
              child: Center(
                child: Obx(() => Text('asd12: ${controller.person().age}',
                style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 191, 148, 148))
                ),)
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 216, 146, 186)
              ),
              child: Center(
                child: GetX(
                  init: Controller(),
                  builder: (controller) => Text(
                    'as : ${Get.find<Controller>().person().age}',
                    style: const TextStyle(fontSize: 23, color: Color.fromARGB(255, 255, 200, 0)),
                  )
                )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
       },
       child: Icon(Icons.add),
       backgroundColor: const Color.fromARGB(255, 90, 126, 145),
      ),
    );
  }
}