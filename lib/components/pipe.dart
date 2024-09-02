import 'package:first_app/game/assets.dart';
import 'package:first_app/game/flappy_bird_game.dart';
import 'package:first_app/game/pipe_position.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../game/configuration.dart';

class Pipe extends SpriteGroupComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await gameRef.loadSprite(Assets.pipe);
    final pipeRotated = await gameRef.loadSprite(Assets.pipeRotated);
    size = Vector2(50, height);

    sprites = {
      PipePosition.top: pipe,
      PipePosition.bottom: pipeRotated,
    };

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        current = PipePosition.bottom;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        current = PipePosition.top;
    }

    add(RectangleHitbox());
  }
}
