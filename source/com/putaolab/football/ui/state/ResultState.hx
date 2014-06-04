package com.putaolab.football.ui.state;

import flixel.FlxSprite;
import component.PTFlxUIState;
import component.PTFlxUIButton;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;

/**
 * User: gaoyun
 * Date: 14-6-2
 * Time: 下午1:35
 * description：游戏结果界面展示玩家是否得奖
 */

class ResultState extends PTFlxUIState{
    public function new() {
        super();
    }

    override public function create():Void
    {
        _makeCursor = true;

        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

        init();
    }

    /**/
    private function init():Void{
        add(new StateBG());
        initButton();
        PromotionRamking();
    }
    /*初始化button*/
    private function initButton():Void
    {
        _toranking = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_toranking);
        _toranking.params = ["groups"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var icon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_player");
        _toranking.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _toranking.x = 50;
        _toranking.y = FlxG.height - _toranking.height-40;
        icon.x = 50;
        icon.y = FlxG.height - icon.height-40;
        add(_toranking);
        add(icon);

        _play = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_play);
        _play.params = ["play"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = FlxG.width-_play.width-50;
        _play.y = FlxG.height - _play.height-40;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-40;
        add(_play);
        add(playicon);
    }

    /* */
    private function PromotionRamking():Void
    {

    }

}
