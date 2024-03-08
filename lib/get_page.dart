import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPage extends StatefulWidget {
  const GetPage({super.key});

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  var url = 'https://jsonplaceholder.typicode.com/posts';
  bool isLoading = true;
  var data = 'No Data';

  void getData() async {
    http.Response response = await http.get(Uri.parse(url));
    setState(() {
      data = response.body;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    print("Init State Called");
    getData();
    print(data.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Button Pressed');
          },
          backgroundColor: Colors.deepPurple.shade500,
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Center(child: Text('First api Call')),
          backgroundColor: Colors.deepPurple.shade500,
        ),
        body: Center(
          child:
              //Column(
              // children: [
              // ElevatedButton(
              //   onPressed: getData,
              //   child:
              //       //const Icon(Icons.add),
              //       const Text('Load Data'),
              // ),

              // isLoading
              //     ? const CircularProgressIndicator()
              //     : Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Text(
              //           '${jsonDecode(data)[0]['title']}',
              //           style: const TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.green),
              //         ),
              //       ),
              // isLoading
              //     ? const CircularProgressIndicator()
              //     : Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Text('${jsonDecode(data)}'),
              //       ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                    //shrinkWrap: true,
                    itemCount: jsonDecode(data).length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple.shade500,
                            child: Text(
                              '${jsonDecode(data)[index]['id']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            '${jsonDecode(data)[index]['title']}',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          subtitle:
                              Text('${jsonDecode(data)[index]['body']}')),
                    ),
                  ),
          // ],
          //),
        ),
      ),
    );
  }
}
