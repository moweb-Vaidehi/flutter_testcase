// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

class ItemModel {
    ItemModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory ItemModel.fromRawJson(String str) => ItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
