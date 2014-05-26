package;

import com.putaolad.soccer.controller.ControllerManager;
import com.putaolad.soccer.charater.Ball;
import com.putaolad.soccer.charater.Player;
import map.Level;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
    private var level:Level;
    private var _controllerManager:ControllerManager;

    public var player1:Player;
    public var player2:Player;
    public var ball:Ball;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();

        level = new Level("assets/tiled/map.tmx",this);
        _controllerManager = new ControllerManager(this);

        add(level.backgroundGroup);
        add(level.characterGroup);
        add(level.decorateGroup);
        add(level.foregroundGroup);
        add(level.collisionGroup);


	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
        level.update();
        _controllerManager.update();
	}	
}