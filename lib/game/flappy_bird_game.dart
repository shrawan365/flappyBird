import 'package:first_app/components/background.dart';
import 'package:first_app/components/bird.dart';
import 'package:first_app/components/ground.dart';
import 'package:first_app/components/pipe_group.dart';
import 'package:first_app/game/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore()
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }

  TextComponent buildScore() {
    return TextComponent(
        text: 'Score: 0',
        anchor: Anchor.center,
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        textRenderer: TextPaint(
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Game')));
  }
}
