package entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;

class SwordSwipe extends FlxSprite
{
  public function new()
  {
    super();

    //loadGraphic("assets/images/slashsprite.png", true, 96, 96);
    makeGraphic(8, 20, FlxColor.YELLOW);

    exists = false;
  }

  public function attack(X:Int, Y:Int, mousePosX:Float, mousePosY:Float):Void
  {
    super.reset(X,Y);
    solid = true;
  }
}