package com.putaolab.soccer.controller;
import fms.GlobalState;
import fms.AttackState;
import fms.StateMachine;
import com.putaolab.soccer.charater.AIPlayerLeft;
import com.putaolab.soccer.charater.Player;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class AIPlayerLeftController extends Controller{
    private var stateMachine:StateMachine;
    public function new(state:PlayState)
    {
        super(state);
        player = state.playerLeft;
        stateMachine =  cast(player,AIPlayerLeft).stateMachine;
        stateMachine.setCurrentSate(new AttackState());
        stateMachine.setGlobalSate(new GlobalState());
    }

    override public function update():Void{
/*        if(FlxG.keys.anyJustPressed(["SPACE"])){
            player.kick(_ball);
        }
//pressed
        if(FlxG.keys.anyJustPressed(["W"])){
            player.jump();
        }
        if(FlxG.keys.anyPressed(["D"])){
            player.runToRight();
        }
        if(FlxG.keys.anyPressed(["A"])){
            player.runToLeft();
            player.lob = true;
        }

//released
        if(FlxG.keys.anyJustReleased(["D"])){
            player.stop();
        }
        if(FlxG.keys.anyJustReleased(["A"])){
            player.stop();
            player.lob = false;
        }*/



        super.update();
        stateMachine.update();



    }

}
