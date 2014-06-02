package;

import com.putaolab.soccer.charater.AIPlayer;
import component.PTFlxUIState;
import flixel.util.FlxRect;
import com.putaolab.soccer.controller.ControllerManager;
import com.putaolab.soccer.controller.ControllerManager;
import com.putaolab.soccer.wiget.Ball;
import com.putaolab.soccer.charater.Player;
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
class PlayState extends PTFlxUIState
{
    public static var level:Level;
    private var _level:Level;
    private var _controllerManager:ControllerManager;

    public var playerLeft:AIPlayer;
    public var playerRight:Player;
    public var goalLeft:FlxSprite;
    public var goalRight:FlxSprite;
    public var ball:Ball;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();


        _level = new Level("assets/tiled/map.tmx",this);
        level = _level;
        _controllerManager = new ControllerManager(this);

        playerLeft.stateMachine.opponent = playerRight;
        playerLeft.stateMachine.leftGoal = goalLeft;
        playerLeft.stateMachine.rightGoal = goalRight;
        playerLeft.stateMachine.ball = ball;


        add(_level.backgroundGroup);
        add(_level.comonBackgroundGroup);
        add(_level.backDecorateGroup);
        add(_level.characterGroup);
        add(_level.decorateGroup);
        add(_level.foregroundGroup);
        add(_level.comonForegroundGroup);
        add(_level.collisionGroup);


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
        _level.update();
        _controllerManager.update();



	}	
}