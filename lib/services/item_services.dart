// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:e_store_app/models/item_model.dart';
import 'package:http/http.dart' as http;

class ApiItemServices {
  var data = [];
  List<ItemModel> results = [];
  String itemUrl =
      'https://api.escuelajs.co/api/v1/products?offset=10&limit=10';
  Future<List<ItemModel>> getItem() async {
    var url = Uri.parse(itemUrl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => ItemModel.fromJson(e)).toList();
      }
    } catch (e) {
     print(e);
    }
    return results;
  }
}
