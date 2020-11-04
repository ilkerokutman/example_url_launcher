import 'package:flutter/material.dart';

class Entity {
  final int id;
  final String name;

  const Entity({
    @required this.id,
    @required this.name,
  });

  factory Entity.fromMap(Map<String, dynamic> map) => Entity(id: map["id"], name: map["name"]);

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "name": this.name,
      };
}
