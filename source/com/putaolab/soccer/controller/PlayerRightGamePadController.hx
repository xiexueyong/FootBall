package com.putaolab.soccer.controller;

import flixel.input.gamepad.FlxGamepad;
import com.putaolab.soccer.charater.Player;
import flixel.FlxG;
class PlayerRightGamePadController extends Controller{
    private var firstTimeMap:Map<Int,Bool>;

    public function new(state:PlayState)
    {
        super(state);
        firstTimeMap = new Map<Int,Bool>();
        player = state.playerRight;
    }

    override public function update():Void{
        //遥控确认键
        #if android
        if(FlxG.android.anyPressed(["OK","ENTER"])){
            player.kick(_ball);
        }else if(FlxG.android.anyJustPressed(["BACK"])){
            // processEvent(EventHandler.BACK);
        }


        //手柄和遥控器方向键
        var gamepadArray:Array<FlxGamepad> = FlxG.gamepads.getActiveGamepads();
        for(i in 0...gamepadArray.length){
            var _gamePad:FlxGamepad = gamepadArray[i];
            if(_gamePad == null)
                continue;
            if (_gamePad.dpadLeft){
                player.runToLeft();
                player.push = true;
                player.lob = false;
            }else if(_gamePad.dpadRight){
                player.runToRight();
                player.lob = true;
                player.push = false;
            }else{
                player.lob = false;
                player.push = false;
            }

            if(_gamePad.dpadUp){
                player.jump();
            }
            if(_gamePad.anyButton()){
                player.kick(_ball);
            }

        }
         #end
        super.update();
    }

}
