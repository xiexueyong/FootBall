package com.putaolad.soccer.controller;

import com.putaolad.soccer.charater.Player;
import flixel.FlxG;
class Player2Controller extends Controller{

    private var player:Player;
    public function new(state:PlayState)
    {
        super(state);
        player = state.player2;
    }

    override public function update():Void{
        if(player != null && player.controllable){
            if(FlxG.keys.anyJustPressed(["SPACE"])){
                player.kick(_ball);
            }
            //pressed
            if(FlxG.keys.anyJustPressed(["UP"])){
                player.jump();
            }
            if(FlxG.keys.anyPressed(["RIGHT"])){
                player.runToRight();
            }
            if(FlxG.keys.anyPressed(["LEFT"])){
                player.runToLeft();
            }

            //released
            if(FlxG.keys.anyJustReleased(["RIGHT"])){
                player.stop();
            }
            if(FlxG.keys.anyJustReleased(["LEFT"])){
                player.stop();
            }
        }

    }

}
