import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class networkHelper {
  late String url;
  networkHelper(this.url);
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      return decodedData;
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }
}
