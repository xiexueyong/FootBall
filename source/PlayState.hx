package;

import String;
import com.putaolab.soccer.charater.AIPlayerLeft;
import com.putaolab.soccer.charater.PlayerRight;
import haxe.Timer;
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
    public static var start:Bool = true;

    private var _level:Level;
    private var _controllerManager:ControllerManager;

    public var playerLeft:AIPlayer;
    public var playerRight:Player;
    public var goalLeft:FlxSprite;
    public var goalRight:FlxSprite;
    public var ball:Ball;
    //leftName  rightName
    private var leftName:String;
    private var rightName:String;
    private var leftCountry:String;
    private var rightCountry:String;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
    public function new(leftName:String,leftCountry:String,rightName:String,rightCountry:String):Void{
        super();
        this.leftName = leftName;
        this.rightName = rightName;
        this.leftCountry = leftCountry;
        this.rightCountry = rightCountry;
    }
	override public function create():Void
	{
		super.create();


        _level = new Level("assets/tiled/map.tmx",this);
        level = _level;
        startMatch(leftName,leftCountry,rightName,rightCountry);
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
    //开始比赛
    private function startMatch(leftName:String,leftCountry:String,rightName:String,rightCountry:String):Void{
				playerRight = new PlayerRight(FlxG.width-350, 0,_level.backDecorateGroup,rightName,rightCountry);
                playerRight.y = Reg.BOUNDS.height - 286;
                playerRight.setBoundsMap(_level.getBounds());
                playerRight.controllable = true;
                _level.characterGroup.add(playerRight);


                playerLeft = new AIPlayerLeft(270, 0,_level.backDecorateGroup,leftName,leftCountry);
                playerLeft.y = Reg.BOUNDS.height-286;
                playerLeft.setBoundsMap(_level.getBounds());
                playerLeft.controllable = false;
                _level.characterGroup.add(playerLeft);

    }
    //是否进球
    public inline function hitTarget():Void{
        if(ball.y > Reg.BOUNDS.height-Reg.GOAL_HEIGHT){
            if(ball.x<156 || ball.x > 1085){
                //ball.x = (FlxG.width - ball.width)/2;
                PlayState.start = false;
                Timer.delay(serve ,2000);
//                serve();
                ball.velocity.x = 0;
            }
        }
    }
    //准备发球
    private inline function waitToRestart():Void{

    }
    //发球
    private function serve():Void{
        //playerleft playerright ball
        PlayState.start = true;
        playerLeft.x = 270;
        playerRight.x = FlxG.width - 350;
        ball.x = 420;
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
        if(PlayState.start == true){
            hitTarget();
        }

	}	
}