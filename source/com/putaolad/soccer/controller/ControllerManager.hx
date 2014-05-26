package com.putaolad.soccer.controller;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class ControllerManager{
    private var _player1Controller:Player1Controller;
    private var _player2Controller:Player2Controller;
    public function new(state:PlayState)
    {
        _player1Controller = new Player1Controller(state);
        _player2Controller = new Player2Controller(state);

    }

    public function update():Void{
        _player1Controller.update();
        _player2Controller.update();

    }

}
