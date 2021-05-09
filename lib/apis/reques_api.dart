// import 'dart:convert';

// import 'package:ecom_ui/models/requis_api_model.dart';
// import 'package:http/http.dart' as http;

// class Services {
//   static Future<UserModel> getData() async {
//     String url = "https://reqres.in/api/users?page=2";
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var jsonData = (json.decode(response.body) as List)
//           .map((data) => UserModel.fromJson(data))
//           .toList();

//       return jsonData;
//     }
//     return null;
//   }
// }

import 'package:ecom_ui/models/requis_api_model.dart';
import 'package:http/http.dart';

class ApiData {
  static Future<UserModel> getData() async {
    var request =
        Request('GET', Uri.parse('https://reqres.in/api/users?page=2'));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      UserModel encodedData = userModelFromJson(body);

      print(body);
      return encodedData;
    } else {
      print(response.reasonPhrase);
      return Future.value(UserModel());
    }
  }
}
