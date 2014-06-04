package fms;

import Math;
import flixel.FlxSprite;
import com.putaolab.soccer.wiget.Ball;
import com.putaolab.soccer.charater.AIPlayer;
import com.putaolab.soccer.charater.Player;
class StateMachine{
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

    public function new(owner:AIPlayer)
    {
        this.owner = owner;
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
        if( Math.abs(owner.x - ball.x) > Math.abs(opponent.x - ball.x)+60 && opponent.x - owner.x < 800){
            if(_currenName != "defend"){
                changeState(_defendState,"defend");
            }
        }else {
            if(_currenName != "attack"){
                changeState(_attackState,"attack");
            }
        }


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
        return  angle;
    }



}
