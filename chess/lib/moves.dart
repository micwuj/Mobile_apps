import 'package:flutter/material.dart';

class MovesModel {
  int? id;
  String? whiteMove;
  String? blackMove;

  MovesModel({
    @required this.id,
    @required this.whiteMove,
    @required this.blackMove,
  });
}
