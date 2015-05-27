package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;

import entities.Player;


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _player:Player;
	private var _level:FlxTilemap;

	override public function create():Void
	{
		_player = new Player(60, 40);
		add(_player);

		_level = new FlxTilemap();
		_level.loadMap(Assets.getText("assets/data/level1.csv"), "assets/images/tileset.png", 32, 32, 0, 1);
		add(_level);

		super.create();
	}

	override public function destroy():Void
	{
		_player.destroy();
		_player = null;

		_level.destroy();
		_level = null;

		super.destroy();
	}

	override public function update():Void
	{
		FlxG.collide();
		super.update();
	}
}