package com.putaolad.soccer.controller;
import com.putaolad.soccer.charater.Player;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Player1Controller extends Controller{
    private var player:Player;
    public function new(state:PlayState)
    {
        super(state);
        player = state.player1;
    }

    override public function update():Void{
        if(FlxG.keys.anyJustPressed(["SPACE"])){
//            _ball.beKicked();
        }

    }

}
