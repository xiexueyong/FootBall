package com.putaolab.football.ui.state;

import component.PTFlxUIButton;
import com.putaolab.football.ui.model.Model;
import flixel.FlxSprite;
import component.PTFlxUIState;
import flixel.addons.ui.FlxUICursor;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import flixel.tweens.FlxTween;

/**
 * User: gaoyun
 * Date: 14-5-28
 * Time: 上午11:35
 * description：选择小组界面
 */

class SelectTeamState extends PTFlxUIState{

    private var _toranking:PTFlxUIButton;
    private var _play:PTFlxUIButton;

    private var group:FlxSpriteGroup;
    //存放每个小组group
    private var _gruparr:Array<FlxSpriteGroup>;


    override public function create():Void
    {
        _makeCursor = true;
        group = new FlxSpriteGroup();
        _gruparr = new Array<FlxSpriteGroup>();
        add(group);
        group.y = 10;
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);
        init();
    }

    private function init():Void
    {
        group.add(new StateBG());
        setTeamFormation();
        initButton();
    }

    /*
    * 初始化button
    * */
    private function initButton():Void
    {
        _toranking = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_toranking);
        _toranking.params = ["groups"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var icon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_player");
        _toranking.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _toranking.x = FlxG.width-_toranking.width-50;
        _toranking.y = FlxG.height - _toranking.height-10;
        icon.x = FlxG.width-icon.width-50;
        icon.y = FlxG.height - icon.height-10;
        add(_toranking);
        add(icon);

        _play = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_play);
        _play.params = ["play"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = FlxG.width-_play.width-50;
        _play.y = FlxG.height - _play.height-10;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-10;
//        add(_play);
//        add(playicon);
    }

    /*设置小组数据*/
    private function setTeamFormation():Void
    {
        var arr:Array<String> = ["A","B","C","D","E","F","G","H"];
        var teamarr:Array<Array<String>>;
        teamarr = Model.getInstance().getTeamData();
        var temlen:Int = teamarr.length;
        for(i in 0...temlen){
            var itemgroup = new FlxSpriteGroup();
            var sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group1");
            var bgbtn:PTFlxUIButton = new PTFlxUIButton();
            cursor.addWidget(bgbtn);
            bgbtn.params = ["team",i];
            bgbtn.loadGraphicsUpOverDown(sp.getFlxFrameBitmapData());
            bgbtn.scale.x = 1.2;
            bgbtn.scale.y = 1.3;
            bgbtn.origin.x =bgbtn.origin.y = 0;
            bgbtn.x = (FlxG.width-sp.width*1.2)*0.5;
//            bgbtn.y= 20+i*(bgbtn.height +27);
            itemgroup.add(bgbtn);
            var teamname = AssetsManager.getInstance().getSprite(0,0,arr[i]);
            teamname.x = (FlxG.width-sp.width*1.2)*0.5+10;
            teamname.y = bgbtn.y +15;
            itemgroup.add(teamname);
            var len:Int = teamarr[i].length;
            for(j in 0...len)
            {
                var country = AssetsManager.getInstance().getSprite(0,0,teamarr[i][j]);
                country.origin.x = country.origin.y = 0;
                country.scale.x = country.scale.y = 0.8;
                country.x = bgbtn.x + 66 + (country.width*0.8+3)*j;
                country.y = bgbtn.y+2;
                itemgroup.add(country);
            }
            group.add(itemgroup);
            _gruparr.push(itemgroup);
            FlxTween.tween(itemgroup,{ x: 0, y: 40+i*(bgbtn.height +25) },0.3);
        }
    }

    /*播放去单人游戏之前界面的动画*/
    private function playAnimation(index:Int=0):Void
    {
        var len = _gruparr.length;
        for(i in 0...len){
//            trace(_gruparr[i]);
            FlxTween.tween(_gruparr[i],{ x: 0, y: -100 },0.3,{ complete: onComplete(index), type: FlxTween.ONESHOT });
        }
    }
    private function onComplete(index:Int):Dynamic{
        return function(t:FlxTween):Void{
            FlxG.switchState(new OnePlayerState(index));
        }
    }

    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
//        trace(id + target + data + params);
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "team":
                            trace("oneplayer"+params[1]);
//                            var state = new OnePlayerState(params[1]);
//                            FlxG.switchState(state);
                            playAnimation(params[1]);
                        case "twoplayer":
                            FlxG.switchState(new TwoPlayerState());
                        case "groups":
                            FlxG.switchState(new OnePlayerState());
                    }
            }
        }
    }


}
