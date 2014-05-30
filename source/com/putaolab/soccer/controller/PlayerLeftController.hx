package com.putaolab.soccer.controller;
import com.putaolab.soccer.charater.Player;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class PlayerLeftController extends Controller{
    public function new(state:PlayState)
    {
        super(state);
        player = state.playerLeft;
    }

    override public function update():Void{
        if(FlxG.keys.anyJustPressed(["SPACE"])){
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
        }
        super.update();



    }

}
