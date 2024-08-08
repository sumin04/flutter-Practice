import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

// https://danawalab.github.io/flutter/2022/08/05/Flutter-Getx.html
// https://alsmaker.tistory.com/39

class ValueListController extends GetxController {
  final RxString _test = "".obs;
  final RxString _value = "".obs;
  RxList<String> valueList = <String>[].obs;

  void _addvalue(){ // 추가
    if(_value.isNotEmpty){
      valueList.add(_value.value);
      print('valueList${valueList}');
      _value.value = "";
    }
  }

  void _change(int index){ // 수정
    // valueList[index] = "$value";

  }

  void _onRemove(int index){ // 삭제
    valueList.removeAt(index);
    update();
  }
  
  void _valueAllClear(){ // 전체삭제
    valueList.clear();
  }

  void _showDialog(int index){
    valueList[index] = "$_test";
    print("$_test");
    Get.back();
  }
}


class GetTodo extends StatelessWidget {
  const GetTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ValueListController());

    return Scaffold(
      appBar: AppBar(title: const Text('GetX 적용'),),
      body: Container(
        padding:  const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(children: [
          Row(children: [
            Flexible(child: 
              TextField(
                autofocus: true,
                maxLength: 12,
                onChanged: (value) {
                  Get.find<ValueListController>()._value.value = value;
                },
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: (){
                  Get.find<ValueListController>()._addvalue();
                  // controller._addvalue();
                },
              child: const Text('저장'),),
          ),
          ]),
          Flexible(
            child: Container(
              color: const Color.fromARGB(255, 236, 239, 241),
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: GetX<ValueListController>(
                init: ValueListController(),
                builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.valueList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      // title: Text("${index +1} : "),
                      title: Text("${index +1} : ${controller.valueList[index]}"),
                      trailing: Wrap(children: [
                        TextButton(
                          onPressed: (){
                            Get.find<ValueListController>()._change(index);
                            showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (controller) {
                                return AlertDialog(
                                  title: const Text('수정하기'),
                                  content: TextField(
                                    autofocus: true,
                                    maxLength: 12,
                                    onChanged: (value) {
                                      Get.find<ValueListController>()._test.value = value;
                                    },
                                  ),
                                  actions: [
                                    TextButton(onPressed: (){
                                        Get.find<ValueListController>()._showDialog(index);
                                        Get.back(closeOverlays: true);
                                      }, child: const Text('확인')
                                    ),
                                    TextButton(onPressed: (){
                                      Get.back();
                                      }, child: const Text('취소')
                                    )
                                  ],
                                );
                              },
                            );
                        },
                        child: const Text('수정')),
                        TextButton(onPressed: (){
                          Get.find<ValueListController>()._onRemove(index);
                        }, child: const Text('삭제')),
                      ],),
                    );
                  }
                ),),
            )
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<ValueListController>()._valueAllClear();
              controller._valueAllClear();
            }, 
            child: const Text('전체 삭제')
          ),
        ],),
      ),
    );
  }
}




// class SimpleController extends GetxController {
//   int index = 0;
//   void asd(){
//     index++;
//     update();
//   }
// }
// class SimpleCounter extends StatelessWidget {
//   const SimpleCounter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SimpleController());

//     return Scaffold(
//       appBar: AppBar(title: const Text('GetX 적용'),),
//       body: Container(
//         child: GetBuilder<SimpleController>(builder: (controller){
//           return ElevatedButton(onPressed: (){
//             controller.asd();
//           }, child: Text('숫자: ${controller.index}'));
//         },)
//       )
//     );
//   }
// } 