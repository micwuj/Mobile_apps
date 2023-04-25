import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:chess_board_using_fen/chess_moves_controller.dart';
import 'package:chess_board_using_fen/fen_list.dart';


class Menu extends StatelessWidget {
  final String board;
  const Menu({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    final ChessMovesController chessMovesController = Get.find<ChessMovesController>(tag: board);

    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = chessMovesController.getFen().toString();

    return Scaffold(
        appBar: AppBar(
          title: Text('Board $board'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: "Move",
                      labelText: "Move",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        chessMovesController.updateFen(textEditingController.text);
                        Get.back();
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        chessMovesController.updateFen(fenList[Random().nextInt(fenList.length).toInt()]);
                        Get.back();
                      },
                      child: const Text("Random FEN"),
                    ),
                  ),
                ),
              ],
            )
          )
        );
  }
}