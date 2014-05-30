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
 * description：
 */

class SelectTeamState extends PTFlxUIState{

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
            bgbtn.scale.x = 1.45;
            bgbtn.scale.y = 1.6;
            bgbtn.origin.x =bgbtn.origin.y = 0;
            bgbtn.x = (FlxG.width-sp.width*1.45)*0.5;
//            bgbtn.y= 20+i*(bgbtn.height +27);
            itemgroup.add(bgbtn);
            var teamname = AssetsManager.getInstance().getSprite(0,0,arr[i]);
            teamname.x = (FlxG.width-sp.width*1.45)*0.5+10;
            teamname.y = bgbtn.y +15;
            itemgroup.add(teamname);
            var len:Int = teamarr[i].length;
            for(j in 0...len)
            {
                var country = AssetsManager.getInstance().getSprite(0,0,teamarr[i][j]);
                country.x = bgbtn.x + 50 + (country.width+3)*j;
                country.y = bgbtn.y+2;
                itemgroup.add(country);
            }
            group.add(itemgroup);
            _gruparr.push(itemgroup);
            FlxTween.tween(itemgroup,{ x: 0, y: 50+i*(bgbtn.height +30) },0.3);
        }
    }

    /*播放去单人游戏之前界面的动画*/
    private function playAnimation(index:Int=0):Void
    {
        var len = _gruparr.length;
        for(i in 0...len){
//            trace(_gruparr[i]);
            FlxTween.tween(_gruparr[i],{ x: 0, y: -50 },0.3,{ complete: onComplete(index), type: FlxTween.ONESHOT });
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
                    }
            }
        }
    }


}
