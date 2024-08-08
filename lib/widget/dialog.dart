// // import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Future<void> customDialog(
//     {required BuildContext context, required Function(String) onChanged}) {
//   return showDialog(
//     context: context,
//     // barrierDismissible: false,
//     builder: (controller) {
//       return AlertDialog(
//         title: const Text('수정하기'),
//         content:
//             TextField(autofocus: true, maxLength: 12, onChanged: (string){}),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text('확인')),
//           TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text('취소'))
//         ],
//       );
//     },
//   );
// }
