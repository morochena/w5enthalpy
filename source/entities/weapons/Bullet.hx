package entities.weapons;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;


class Bullet extends FlxSprite
{
  private var _speed:Float;
  private var _direction:Int;
  private var _damage:Float;

  public function new(X:Float, Y:Float, Speed:Float, Direction:Int,Damage:Float)
  {
    super(X, Y);
    _speed = Speed;
    _direction = Direction;
    _damage = Damage;
    makeGraphic(6, 6, FlxColor.YELLOW);
  }

  public override function destroy():Void
  {
    super.destroy();
  }

  public override function update():Void
  {
    if (_direction == FlxObject.LEFT){
      velocity.x = -_speed;
    }
    if (_direction == FlxObject.RIGHT){
      velocity.x = _speed;
    }
    if (_direction == FlxObject.FLOOR){
      velocity.y = _speed;
    }
    if (_direction == FlxObject.CEILING){
      velocity.y = -_speed;
    }

    if (touching != 0)
    {
      kill();
    }
    else
    {
      super.update();
    }

  }
}