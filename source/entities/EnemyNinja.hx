package entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;

class EnemyNinja extends FlxSprite
{
  public var run_speed:Float = 200;
  public var jump_speed:Float = 200;
  public var gravity:Float = 420;

  private var _player:Player;

  public function new(X:Float, Y:Float, player:Player) {
    super(X, Y);
    makeGraphic(16, 16, FlxColor.RED);

    maxVelocity.set(run_speed, jump_speed);
    acceleration.y = gravity; // gravity
    drag.x = maxVelocity.x * 4;

    // AI Stuff
    _player = player;
  }

  public override function update() {
    acceleration.x = 0;
    acceleration.y = gravity;

    var xDistanceFromPlayer:Float = _player.x - x;
    var yDistanceFromPlayer:Float = _player.y - x;
    var distanceSquared:Float = xDistanceFromPlayer * xDistanceFromPlayer + yDistanceFromPlayer * yDistanceFromPlayer;

    if (distanceSquared < 65000)
    {
      if (_player.x < x)
      {
        acceleration.x = -drag.x;
      }
      if (_player.x > x)
      {
        acceleration.x = drag.x;
      }
    }
    super.update();
  }

}