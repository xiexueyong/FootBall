package fms;

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
    private var _previousState:BaseState;
    private var _globalState:BaseState;
    private var _instance:StateMachine;

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
    private function changeState(newState:BaseState):Void{
        this._previousState = _currentState;
        this._currentState.exit();
        this._currentState = newState;
        this._currentState.enter();

    }
    public function update():Void{
//        trace("ddddd");
        if(_currentState != null)
            _currentState.excute(this);
        if(_globalState != null)
            _globalState.excute(this);

    }



}
