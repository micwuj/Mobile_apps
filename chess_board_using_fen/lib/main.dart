import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:chess_board_using_fen/moves_page.dart';
import 'package:chess_board_using_fen/chess_moves_controller.dart';

void main() {
  runApp(GetMaterialApp(home: HomePage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ChessMovesController chessMovesController1 = Get.put(ChessMovesController(), tag: '1');
  final ChessMovesController chessMovesController2 = Get.put(ChessMovesController(), tag: '2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess moves'),
        centerTitle: true,
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(
                          () => ChessBoard(
                              enableUserMoves: false,
                              controller: 
                              ChessBoardController.fromFEN(chessMovesController1.getFen().toString()),
                              boardColor: BoardColor.orange,
                              boardOrientation: PlayerColor.white
                              ),),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(const Menu(board: '1',));
                        },
                        child: const Text("Make Move")),
                    ],
                  ),),
                  Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(
                          () => ChessBoard(
                              enableUserMoves: false,
                              controller: 
                              ChessBoardController.fromFEN(chessMovesController2.getFen().toString()),
                              boardColor: BoardColor.orange,
                              boardOrientation: PlayerColor.white),
                              ),
                      ),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(const Menu(board: '2',));
                              },
                              child: const Text("Make Move")),
                    ],
                  ),)
                ],
              ),
          ],),),
      ),);
  }
}