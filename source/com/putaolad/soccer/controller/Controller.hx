package com.putaolad.soccer.controller;
import com.putaolad.soccer.charater.Player;
import com.putaolad.soccer.charater.Ball;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Controller{
    private var parentState:PlayState;
    private var _player1:Player;
    private var _player2:Player;
    private var _ball:Ball;
    public function new(state:PlayState)
    {
        parentState = state;
        _player1 = parentState.player1;
        _player2 = parentState.player2;
        _ball = parentState.ball;
    }

    public function update():Void{


    }

}
