package com.putaolab.soccer.controller;
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
    public function new(state:PlayState)
    {
        _playerLeftController = new PlayerLeftController(state);
        _playerRightController = new PlayerRightController(state);
        _aiPlayerLeftController = new AIPlayerLeftController(state);

    }

    public function update():Void{

            _playerLeftController.update();
            _playerRightController.update();
            if(PlayState.start == true){
                _aiPlayerLeftController.update();
            }


    }

}
