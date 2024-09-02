import 'package:first_app/game/flappy_bird_game.dart';
import 'package:first_app/screens/game_over.dart';
import 'package:first_app/screens/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game),
    },
  ));
}
