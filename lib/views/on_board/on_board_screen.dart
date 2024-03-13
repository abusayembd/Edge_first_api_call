import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/on_board_controller.dart';

class OnBoardScreen extends StatelessWidget {
   OnBoardScreen({super.key});
  final onBoardController = Get.put(OnBoardController());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent,
        child:  Column(
          children: [
            const Center(
              child: Text('OnBoard Screen'),
            ),
            ElevatedButton(onPressed:(){
              onBoardController.onGoToHome;
            }, child: const Text("Get Post Screen"))
          ],
        ));
  }
}
