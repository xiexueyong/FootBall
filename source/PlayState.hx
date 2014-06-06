package;

import com.putaolab.football.ui.state.MatchResultPopState;
import flixel.util.FlxTimer;
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
    public static var MATCH_SECOND:Int = 5;
    public static var start:Bool = false;

    private var _level:Level;
    private var _controllerManager:ControllerManager;

    public var playerLeft:AIPlayer;
    public var playerRight:Player;
    public var goalLeft:FlxSprite;
    public var goalRight:FlxSprite;
    public var ball:Ball;
    private var matchTimer:FlxTimer;

    //leftName  rightName
    private var leftName:String;
    private var rightName:String;
    private var leftCountry:String;
    private var rightCountry:String;
    // 0:左边比分，1：右边比分
    private var scores:Array<Int> = [0,0];
    private var _scoreBar:FlxText;
    private var _timeBar:FlxText;



	/**
	 * Function that is called up when to state is created to set it up. 
	 */
    public function new(?leftName:String,?leftCountry:String,?rightName:String,?rightCountry:String):Void{
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

        //时间、分数
        _scoreBar = new FlxText(0, 630, FlxG.width,"0",80);
//        _scoreBar.setFormat("assets/fonts/num.ttf");
        _scoreBar.alignment = "center";
        _scoreBar.color = 0x000000;
        _scoreBar.size = 60;
        _scoreBar.x = (FlxG.width - _scoreBar.width) /2;
//        _scoreBar.visible = false;
        _scoreBar.text = "0:0";
        add(_scoreBar);
        _timeBar = new FlxText(0, 50, FlxG.width,"0",80);
//        _timeBar.setFormat("assets/fonts/num.ttf");
        _timeBar.alignment = "center";
        _timeBar.color = 0x000000;
        _timeBar.size = 60;
        _timeBar.x = (FlxG.width - _timeBar.width) /2;
        _timeBar.text = "0";
//        _timeBar.visible = false;
        add(_timeBar);
	}
    //开始比赛
    private function startMatch(leftName:String,leftCountry:String,rightName:String,rightCountry:String):Void{
				playerRight = new PlayerRight(FlxG.width-350, 0,_level.backDecorateGroup,rightName,rightCountry);
                playerRight.y = Reg.BOUNDS.height - playerRight.height;
                playerRight.setBoundsMap(_level.getBounds());
                playerRight.controllable = true;
                _level.characterGroup.add(playerRight);


                playerLeft = new AIPlayerLeft(270, 0,_level.backDecorateGroup,leftName,leftCountry);
                playerLeft.y = Reg.BOUNDS.height-playerLeft.height;
                playerLeft.setBoundsMap(_level.getBounds());
                playerLeft.controllable = false;
                _level.characterGroup.add(playerLeft);

                ball = new Ball(0, 0);
                ball.x = (FlxG.width - ball.width)/2;
                ball.y = Reg.BOUNDS.height - ball.height;
                //ball.velocity.y = 1500;
                ball.setBoundsMap(_level.getBounds());
                _level.characterGroup.add(ball);

                Timer.delay(startGame,1000);
    }
    //是否进球
    public inline function hitTarget():Void{
        if(ball.y > Reg.BOUNDS.height-Reg.GOAL_HEIGHT){
            //1代表左赢  2代表右赢
            if(ball.x<156){
                PlayState.start = false;
                scores[1] += 1;
                _scoreBar.text = scores[0]+":"+scores[1];
                Timer.delay(
                    function(){
                        serve(420);
                    },1500);
            }else if(ball.x > 1085){
                PlayState.start = false;
                scores[0] += 1;
                _scoreBar.text = scores[0]+":"+scores[1];
                Timer.delay(
                    function(){
                        serve(860);
                    },1500);
            }

        }
    }
    //准备发球
    private inline function startGame():Void{
        matchTimer = new FlxTimer(1,onTimer,MATCH_SECOND);
        PlayState.start = true;
        ball.velocity.y = 1500;


    }
    private function onTimer(timer:FlxTimer):Void{
        _timeBar.text = Std.string(matchTimer.elapsedLoops);
        if(matchTimer.elapsedLoops >= PlayState.MATCH_SECOND){
        trace("_______MatchResultPopState___________");
            openSubState(new MatchResultPopState(leftCountry,rightCountry,scores));
        }

    }
    //发球
    private function serve(ball_x:Float):Void{
        //playerleft playerright ball

        playerLeft.x = 270;
        playerRight.x = FlxG.width - 350;
        ball.velocity.x = ball.velocity.y = 0;
        ball.x = ball_x;
        Timer.delay(
            function(){
                PlayState.start = true;
            },1000);

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