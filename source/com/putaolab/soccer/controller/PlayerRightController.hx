package com.putaolab.soccer.controller;

import com.putaolab.soccer.charater.Player;
import flixel.FlxG;
class PlayerRightController extends Controller{

    public function new(state:PlayState)
    {
        super(state);
        player = state.playerRight;
    }

    override public function update():Void{

        if(FlxG.keys.anyJustPressed(["ENTER"])){
            player.kick(_ball);
        }
        //pressed
        if(FlxG.keys.anyJustPressed(["UP"])){
            player.jump();
        }
        if(FlxG.keys.anyPressed(["RIGHT"])){
            player.runToRight();
            player.lob = true;
        }
        if(FlxG.keys.anyPressed(["LEFT"])){
            player.runToLeft();
            player.push = true;
        }

        //released
        if(FlxG.keys.anyJustReleased(["RIGHT"])){
            player.stop();
            player.lob = false;
        }
        if(FlxG.keys.anyJustReleased(["LEFT"])){
            player.stop();
            player.push = false;

        }
        super.update();
    }

}
