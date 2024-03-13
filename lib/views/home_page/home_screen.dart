import 'dart:convert';

import 'package:first_api_app/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  bool isLoading = false;

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: controller.getData,
          backgroundColor: Colors.deepPurple.shade500,
          child: const Center(
            child: Text(
              "Get Posts",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        appBar: AppBar(
          title: Center(
              child: Obx(() => Text(controller.isLoading.value.toString()))),
          backgroundColor: Colors.deepPurple.shade500,
        ),
        body: Obx(
          () => Center(
            child: controller.isLoading.value
                ? const CircularProgressIndicator()
                : ListView.builder(
                    //shrinkWrap: true,
                    itemCount: jsonDecode(controller.data).length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple.shade500,
                            child: Text(
                              '${jsonDecode(controller.data)[index]['id']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            '${jsonDecode(controller.data)[index]['title']}',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          subtitle: Text(
                              '${jsonDecode(controller.data)[index]['body']}')),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
