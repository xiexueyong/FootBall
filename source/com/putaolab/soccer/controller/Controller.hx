package com.putaolab.soccer.controller;
import com.putaolab.soccer.charater.Player;
import com.putaolab.soccer.wiget.Ball;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Controller{
    private var parentState:PlayState;
    private var _playerLeft:Player;
    private var _playerRight:Player;
    private var player:Player;
    private var _ball:Ball;
    public function new(state:PlayState)
    {
        parentState = state;
        _playerLeft = parentState.playerLeft;
        _playerRight = parentState.playerRight;
        _ball = parentState.ball;
    }

    public function update():Void{
        player.forecastDirection(_ball);
    }

}
