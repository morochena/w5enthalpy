package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;

import entities.Player;
import entities.EnemyNinja;

import entities.weapons.Bullet;


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _player:Player;
	private var _enemy:EnemyNinja;
	private var _level:FlxTilemap;

	public var _swipes:FlxGroup;
	public var playerBullets:FlxTypedGroup<Bullet>;

	override public function create():Void
	{
		playerBullets = new FlxTypedGroup<Bullet>();
		add(playerBullets);

		_player = new Player(60, 40, playerBullets);
		add(_player);

		_enemy = new EnemyNinja(320, 400, _player);
		add(_enemy);

		_level = new FlxTilemap();
		_level.loadMap(Assets.getText("assets/data/level1.csv"), "assets/images/tileset.png", 16, 16, 0, 1);
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