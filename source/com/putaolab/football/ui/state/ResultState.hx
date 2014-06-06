package com.putaolab.football.ui.state;

import com.putaolab.football.ui.model.CompetitionModel;
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
    private var _kostage:PTFlxUIButton;
    private var _mainmenu:PTFlxUIButton;
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

    /*
    *
    * */
    private function init():Void{
        add(new StateBG());
        initButton();
        Top();
    }
    /*初始化button*/
    private function initButton():Void
    {
        _kostage = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_kostage);
        _kostage.params = ["kostage"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var icon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_kostage");
        _kostage.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _kostage.x = 50;
        _kostage.y = FlxG.height - _kostage.height-40;
        icon.x = 50;
        icon.y = FlxG.height - icon.height-40;
        add(_kostage);
        add(icon);

        _mainmenu = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_mainmenu);
        _mainmenu.params = ["play"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_mainmenu");
        _mainmenu.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _mainmenu.x = FlxG.width-_mainmenu.width-50;
        _mainmenu.y = FlxG.height - _mainmenu.height-40;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-40;
        add(_mainmenu);
        add(playicon);
    }

    /*
     *
     * */
    private function Top():Void
    {
        var Podium:FlxSprite = AssetsManager.getInstance().getSprite(0,0,"winner_pedestal");
        Podium.x = 320;
        Podium.y = 460;
        add(Podium);

        var prethree:Array<String> = CompetitionModel.getInstance().getPreThree();
        for(i in 0...prethree.length){
            trace(prethree[i]);
        }
    }

    /*设置每个国家的队员*/
    private function setFootBallerFormCountry(X,Y,name:String):Void
    {
        var footballer = AssetsManager.getInstance().getSprite(0,0,"head_"+name);
        footballer.x = footballer.width;
        footballer.y = FlxG.height - (Reg.TEERAIN_DEEP+footballer.height);
        setFootBallerBody(footballer.x+(footballer.width-30)*0.5,footballer.y+footballer.height-12,name);
        add(footballer);

    }

    /*
    *设置队员的身体
    * */
    private function setFootBallerBody(X:Float,Y:Float,name:String):Void
    {
        var body = AssetsManager.getInstance().getSprite(0,0,"body_"+name);
        body.x = X;
        body.y = Y;
        add(body);
        setFootBallerHand(body.x,body.y,name);
    }

    /*
    *设置队员的手臂
    * */
    private function setFootBallerHand(X:Float,Y:Float,name:String):Void
    {
        var hand = AssetsManager.getInstance().getSprite(0,0,"hand_"+name);
        hand.x = X-hand.width +35;
        hand.y = Y-hand.height+35;
        add(hand);
    }

    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "kostage":
                            FlxG.switchState(new FinalsState());
                        case "play":
                            FlxG.switchState(new OnePlayerState());
                    }
            }

        }
    }

}
