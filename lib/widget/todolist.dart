import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:test_fullter/widget/textField.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // 1. TextEditingController 생성
  final TextEditingController _controller = TextEditingController();
  // 2. 상태를 업데이트하기 위한 변수 추가
  String _value = "";
  final List<String> _valueList = [];

  // String message = Get.arguments;

  void test1() { // 입력 값 띄우기
    // 값이 비어있지 않을 때
    if (_value.isNotEmpty) {
      setState(() {
        _valueList.add(_value);
        _controller.clear();
        // 이거 안 하면 field가 비어있어도 마지막에 입력된 값으로 계속 저장 됨
        _value = "";

        print('_valueList: $_valueList');
      });
    }
  }

  void _change(int index) { // 수정
    setState(() {
      _valueList[index] = '$_value';
      // 값 비우기
      _value = "";
      _controller.clear();
    });
  }

  void _onRemove(int index) { // 삭제
    setState(() {
      _valueList.removeAt(index);
      print('Selected Index: ${index + 1}');
    });
  }

  void _valueClear() { // 전체 삭제
    setState(() {
      _valueList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('to do list'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    autofocus: true,
                    maxLength: 12,
                    controller: _controller,
                    onChanged: (text) {
                      _value = text; // TextField의 값이 변경될 때마다 _value를 업데이트
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextButton(
                    onPressed: test1,
                    child: const Text('저장'),
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 5,
              child: Container(
                color: const Color.fromARGB(255, 236, 239, 241),
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: ListView.builder(
                  shrinkWrap: true, // 리스트 자식 높이 크기의 합 만큼으로 영역 고정.
                  itemCount: _valueList.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      title: Text('${index + 1}번째 : ${_valueList[index]}'),
                      trailing: Wrap(
                        children: <Widget>[
                          TextButton(
                            onPressed: () => _change(index),
                            child: const Text('수정'),
                          ),
                          TextButton(
                            onPressed: () => _onRemove(index),
                            child: const Text('삭제'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const TextFieldFrom(),
            Expanded(
              child: SizedBox(
                child: Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () => _valueClear(),
                      child: const Text('모두 삭제'),
                    ),
                    // Text(message),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
