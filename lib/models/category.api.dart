// import 'dart:convert';
// import 'dart:math';
// import 'package:http/http.dart' as http;
// import 'package:nurse_diary/models/category.dart';
//
// class CategoryApi {
//   static Future<List<Category>> getCategories() async {
//     var uri = Uri.https('k7ap1irwai.api.quickmocker.com', '/categories');
//     final response = await http.get(uri);
//     print(response.body);
//     final List body = json.decode(response.body);
//     List<Category> categories = body
//         .map(
//           (dynamic item) => Category.fromJson(item),
//         )
//         .toList();
//
//     return categories;
//   }
// }
