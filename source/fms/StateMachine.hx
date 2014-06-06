package fms;

import flixel.FlxG;
import flixel.util.FlxTimer;
import Math;
import flixel.FlxSprite;
import com.putaolab.soccer.wiget.Ball;
import com.putaolab.soccer.charater.AIPlayer;
import com.putaolab.soccer.charater.Player;
class StateMachine{
    private static var SWITCH_INTERVAL:Float = 0.2;
    public var owner:AIPlayer;
    //环境成员
    public var opponent:Player;
    public var ball:Ball;
    public var leftGoal:FlxSprite;
    public var rightGoal:FlxSprite;

    private var _currentState:BaseState;
    private var _currenName:String = "attack";
    private var _previousState:BaseState;
    private var _globalState:BaseState;
    private var _instance:StateMachine;

    private var _defendState:BaseState = new DefendState();
    private var _attackState:BaseState = new AttackState();

    private var _timer:FlxTimer;
    private var forceAttackTimer:FlxTimer;
    private var _forceAttack:Bool = false;
    /////////////////


    private inline function startGame():Void{
        forceAttackTimer = new FlxTimer(0.5,function(timer:FlxTimer){
            if(_forceAttack){
                _forceAttack = false;
                return;
            }else if(Math.random()<0.5){
                _forceAttack = true;
            }

            trace("_forceAttack----",_forceAttack);
        },0);
    }
    private function selectState(t:FlxTimer):Void{
        //--------------------防守---------------------------------
        //球在对方，且距离对方较近
        if( Math.abs(owner.x - ball.x) > Math.abs(opponent.x - ball.x)-50 && ball.x > 675){
            if(_currenName != "defend"){
                changeState(_defendState,"defend");
            }
        }else
        //球在天空，且快速飞向owner
        if(ball.y<owner.y-30 && ball.velocity.x < -200){
            if(_currenName != "defend"){
                changeState(_defendState,"defend");
            }
        }




        //--------------------进攻---------------------------------
        //球在对手的身后，进攻
        if(_forceAttack && ball.y > owner.y){
            if(_currenName != "attack"){
                changeState(_attackState,"attack");
            }
        }else
        if(ball.x > opponent.x){
            if(_currenName != "attack"){
                changeState(_attackState,"attack");
            }
        }else
        //球过半场，进攻
        if(ball.x < 788 && ball.y > Reg.BOUNDS.height- owner.height){
            if(_currenName != "attack"){
                changeState(_attackState,"attack");
            }
        }else
        //两球员距离小于350，则进攻
        if(Math.abs(owner.x - opponent.x) < 400){
            if(_currenName != "attack"){
                changeState(_attackState,"attack");
            }
        }
    }

    public function new(owner:AIPlayer)
    {
        this.owner = owner;
        startGame();

    }
    public function setCurrentSate(state:BaseState):Void{
        _currentState = state;
    }

    public function setGlobalSate(state:BaseState):Void{
        _globalState = state;
    }
    private function changeState(newState:BaseState,?stateName:String):Void{
        this._currenName = stateName;
        this._previousState = _currentState;
        this._currentState.exit();
        this._currentState = newState;
        this._currentState.enter();

    }

    public function update():Void{
        selectState(null);
        if(_currentState != null)
            _currentState.excute(this);
        if(_globalState != null)
            _globalState.excute(this);
    }
    //返回度数
    public function getBestKickAngle():Float{

        var angle:Float = 0;

        var ogx:Float = rightGoal.x - opponent.x;//对手与球门的距离
        if(owner.x > opponent.x){
            angle = 0;
        }else if(ogx > 100){
        //直奔球门
            var dx:Float = ogx;//与对手之间的距离
            var temp:Float = 2*dx*Reg.BALL_GRAVITY/Reg.BALL_KICKEDVELOCITY/Reg.BALL_KICKEDVELOCITY;

            if(temp > 0.5)temp = 0.5;
            var radius:Float = Math.asin(temp*2)/2;
            angle = radius*180/Math.PI;
//            trace(".......直奔球门.........",angle);
        }else{
        //越过对方球员头顶
            var dx:Float = opponent.x - owner.x;//与对手之间的距离
            var temp:Float = 0.55*dx*Reg.BALL_GRAVITY/Reg.BALL_KICKEDVELOCITY/Reg.BALL_KICKEDVELOCITY;
            if(temp > 0.5)temp = 0.5;
            var radius:Float = Math.asin(temp*2)/2;
            angle = radius*180/Math.PI;
//            trace(".......头顶.........",angle);
        }

        if(ball.x > owner.x && ball.x < opponent.x && opponent.x - ball.x < 250 && opponent.x - ball.x > 110){
            //球在2球员之间，球往天上踢,2球员距离很近
            angle = 40;
        }else
        if(ball.x > owner.x && ball.x < opponent.x && rightGoal.x - opponent.x > 240){
            //球在2球员之间，球往天上踢,2球员距离很近
            angle = 55;
        }
        return  angle;
    }



}
