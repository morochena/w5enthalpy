package entities.weapons;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.util.FlxPoint;


class Bullet extends FlxSprite
{
  private var _speed:Float;
  private var _damage:Float;

  public function new()
  {
    super();
    makeGraphic(6, 6, FlxColor.YELLOW);
    exists = false;
  }

  public override function destroy():Void
  {
    super.destroy();
  }

  public override function update():Void
  {

    if (touching != 0)
    {
      kill();
    }
    else
    {
      super.update();
    }

  }

  public function shoot(X:Int, Y:Int, Target:FlxPoint):Void
  {
    _speed = 900;
    super.reset(X, Y);
    solid = true;
    var rangle:Float = Math.atan2(Target.y - (y + (height / 2)), Target.x - (x + (width / 2)));
    velocity.x = Math.cos(rangle) * _speed;
    velocity.y = Math.sin(rangle) * _speed;
  }
}