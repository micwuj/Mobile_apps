import 'package:get/get.dart';

class ChessMovesController extends GetxController {
  RxString fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'.obs;

  void updateFen(String newFen) {
    fen.value = newFen;
  }

  RxString getFen() {
    return fen;
  }
}