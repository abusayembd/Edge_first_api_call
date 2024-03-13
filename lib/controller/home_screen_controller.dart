import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  var url = 'https://jsonplaceholder.typicode.com/posts';
  bool isolated = false;

  RxBool isLoading = false.obs;
  var data = 'No Data';

  getData() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(url));
    data = response.body;
    isLoading.value = false;
  }

}
