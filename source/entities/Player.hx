package entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;

class Player extends FlxSprite
{
  public var run_speed:Float = 300;
  public var jump_speed:Float = 300;
  public var gravity:Float = 420;

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    makeGraphic(16, 16, FlxColor.BLUE);

    maxVelocity.set(run_speed, jump_speed);
    acceleration.y = gravity; // gravity
    drag.x = maxVelocity.x * 4;

  }

  public override function update()
  {
    acceleration.x = 0;
    acceleration.y = gravity;

    if (FlxG.keys.anyPressed(["LEFT", "A"]))
    {
      acceleration.x = -maxVelocity.x * 4;
    }
    if (FlxG.keys.anyPressed(["RIGHT", "D"]))
    {
      acceleration.x = maxVelocity.x * 4;
    }

    if (FlxG.keys.anyPressed(["SPACE", "W", "UP"]))
    {
      if (isTouching(FlxObject.FLOOR))
      {
        velocity.y = -maxVelocity.y * 0.75;
      }
      else if (isTouching(FlxObject.RIGHT))
      {
        velocity.y = -maxVelocity.y * 0.75;
        velocity.x = -maxVelocity.x * 0.5;
      }
      else if (isTouching(FlxObject.LEFT))
      {
        velocity.y = -maxVelocity.y * 0.75;
        velocity.x = maxVelocity.x * 0.5;
      }
    }

    if (FlxG.keys.anyPressed(["S", "DOWN"]))
    {
        acceleration.y = gravity * 4;
    }


    super.update();
  }
}