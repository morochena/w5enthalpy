package entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxPoint;

import entities.weapons.Bullet;

class Player extends FlxSprite
{
  public var run_speed:Float = 300;
  public var jump_speed:Float = 300;
  public var gravity:Float = 420;
  public var gun_delay:Float = 0.4;

  private var _bulletArray:FlxTypedGroup<Bullet>;
  private var _bullet:Bullet;
  private var _shotCooldown:Float;

  public function new(X:Float=0, Y:Float=0, playerBulletArray:FlxTypedGroup<Bullet>)
  {
    super(X, Y);
    makeGraphic(16, 16, FlxColor.BLUE);

    maxVelocity.set(run_speed, jump_speed);
    acceleration.y = gravity; // gravity
    drag.x = maxVelocity.x * 4;

    _bulletArray = playerBulletArray;
    _shotCooldown = gun_delay;

  }

  public override function update()
  {
    acceleration.x = 0;
    acceleration.y = gravity;

    handleInput();

    _shotCooldown += FlxG.elapsed;

    super.update();
  }

  private function handleInput():Void
  {
    if (FlxG.keys.anyPressed(["LEFT", "A"]))
    {
      acceleration.x = -maxVelocity.x * 4;

      if (isTouching(FlxObject.LEFT))
      {
        velocity.y = maxVelocity.y * 0.25;
      }
    }
    if (FlxG.keys.anyPressed(["RIGHT", "D"]))
    {
      acceleration.x = maxVelocity.x * 4;

      if (isTouching(FlxObject.RIGHT))
      {
        velocity.y = maxVelocity.y * 0.25;
      }
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

    if (FlxG.mouse.pressed)
    {
      attack();
    }
  }

  private function attack():Void
  {
    if (_shotCooldown >= gun_delay)
    {
      _bullet = _bulletArray.recycle(Bullet);

      if(_bullet != null)
      {
        var mouseLoc:FlxPoint = new FlxPoint();
        mouseLoc.x = FlxG.mouse.x;
        mouseLoc.y = FlxG.mouse.y;
        _bullet.shoot(Math.floor(x), Math.floor(y), mouseLoc);
        FlxG.sound.play("assets/sounds/laser_shoot.wav", 1, false);
        _shotCooldown = 0;
      }
    }
  }

}