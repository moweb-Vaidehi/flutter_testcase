import 'package:flutter_testcase/model/item_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class ApiProvider {
  final Client client;

  ApiProvider({required this.client});
  fetchPosts() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    ItemModel itemModel = ItemModel.fromJson(json.decode(response.body));
    return itemModel;
  }
}
