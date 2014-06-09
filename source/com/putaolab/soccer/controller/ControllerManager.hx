package com.putaolab.soccer.controller;
import com.putaolab.soccer.controller.PlayerRightGamePadController;
import com.putaolab.soccer.controller.PlayerRightController;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class ControllerManager{
    private var _playerLeftController:PlayerLeftController;
    private var _aiPlayerLeftController:AIPlayerLeftController;
    private var _playerRightController:PlayerRightController;
    private var _playerRightGamePadController:PlayerRightGamePadController;
    public function new(state:PlayState)
    {
//        _playerLeftController = new PlayerLeftController(state);
        _playerRightController = new PlayerRightController(state);
        _playerRightGamePadController = new PlayerRightGamePadController(state);
        _aiPlayerLeftController = new AIPlayerLeftController(state);

    }

    public function update():Void{
//        if(PlayState.start){
            _playerRightController.update();
            _playerRightGamePadController.update();
            _aiPlayerLeftController.update();
//        }
    }

}
