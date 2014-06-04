package com.putaolab.football.ui.state;
import com.putaolab.football.footballer.FootBallerItem;
import component.PTFlxUIList;
import component.PTFlxUIButton;
import flixel.FlxSprite;
import component.PTFlxUIState;
import flixel.group.FlxSpriteGroup;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;
import flixel.util.FlxPoint;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.addons.ui.FlxUIList;

/**
 * User: gaoyun
 * Date: 14-5-27
 * Time: 下午1:48
 * description：
 */
class TwoPlayerState extends PTFlxUIState{

    private var _back:PTFlxUIButton;
    private var _play:PTFlxUIButton;
    private var _footballeronepanel:FlxSpriteGroup;
    private var _footballerotwepanel:FlxSpriteGroup;

    override public function create():Void
    {
        _makeCursor = true;
        group = new FlxSpriteGroup();
        group.y = 10;
        add(group);
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

        _footballeronepanel = new FlxSpriteGroup();
        _footballerotwepanel = new FlxSpriteGroup();
        init();
    }

    private var group:FlxSpriteGroup;
    public function init():Void
    {
        group.add(new StateBG());
        add(_footballeronepanel);
        add(_footballerotwepanel);
        initButton();
        initFootballer();
        allPropertyPanel();
//        _footballeronepanel.
// scale.y=_footballerotwepanel.scale.y = 2.5;
//        _footballeronepanel.scale.x=_footballerotwepanel.scale.x = 2.5;
//        _footballeronepanel.x = 200;
//        _footballeronepanel.y = 100;
//        _footballerotwepanel.x = 600;
//        _footballerotwepanel.y = 100;
    }

    /*初始化按钮*/
    private function initButton():Void
    {
        _back = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_back);
        _back.params = ["back"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var backicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_mainmenu");
        _back.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _back.x = 50;
        _back.y = FlxG.height - _back.height-40;
        backicon.x = 50;
        backicon.y = FlxG.height - backicon.height-40;
        group.add(_back);
        group.add(backicon);

        _play = new PTFlxUIButton(880,450,null);
        cursor.addWidget(_play);
        _play.params = ["play"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(880,450,"btn_iko_play");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = FlxG.width-_play.width-50;
        _play.y = FlxG.height - _play.height-40;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-40;
        group.add(_play);
        group.add(playicon);
    }
//    private var _footballerone;
//    private var _footballertwo;
    /*初始化球员显示*/
    private function initFootballer():Void
    {
        var arrdata:Array<String> = ["head_alves","head_balotelli","head_beckenbauer"];

        var arr:Array<IFlxUIWidget> = new Array<IFlxUIWidget>();
        for(i in 0...arrdata.length)
        {
            var item = new FootBallerItem();
            item.datas = arrdata[i];
            item.init();
            arr.push(item);
        }
        var arr2:Array<IFlxUIWidget> = new Array<IFlxUIWidget>();
        for(i in 0...arrdata.length)
        {
            var item = new FootBallerItem();
            item.datas = arrdata[i];
            item.init();
            arr2.push(item);
        }
        var prebutton = new PTFlxUIButton(0,0,null);
        var pre = AssetsManager.getInstance().getSprite(0,0,"btn_iko_back");
        prebutton.loadGraphicsUpOverDown(pre.getFlxFrameBitmapData());
//        group.add(prebutton);
        var nextbutton = new PTFlxUIButton(0,0,null);
        var next = AssetsManager.getInstance().getSprite(0,0,"btn_iko_back");
        nextbutton.loadGraphicsUpOverDown(next.getFlxFrameBitmapData());
        next.flipX = true;
        group.add(nextbutton);

        var _footballerone:PTFlxUIList = new PTFlxUIList(0,0,arr,100,100,null,FlxUIList.STACK_HORIZONTAL,0,new FlxPoint(0,0),new FlxPoint(0,0),null,null,cursor);
        _footballerone.x = 420;
        _footballerone.y = 450;
        group.add(_footballerone);
        var _footballertwo:PTFlxUIList = new PTFlxUIList(0,0,arr2,100,100,null,FlxUIList.STACK_HORIZONTAL,0,new FlxPoint(0,0),new FlxPoint(0,0),null,null,cursor);
        _footballertwo.x = 780;
        _footballertwo.y = 450;
        group.add(_footballertwo);

    }


    private var _propertygroup1:FlxSpriteGroup;
    private var _propertygroup2:FlxSpriteGroup;
    private function allPropertyPanel():Void
    {
        initPropertyPanel(_propertygroup1,150,80);
        initPropertyPanel(_propertygroup2,650,80);
    }


    /*设置球员属性面板*/
    private function initPropertyPanel(_propertygroup:FlxSpriteGroup,X:Float=0,Y:Float=0):Void{
        if(_propertygroup==null){
            _propertygroup = new FlxSpriteGroup();
            add(_propertygroup);
        }
        var footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage1");
        _propertygroup.add(footballeronepanel);
        footballeronepanel.origin.x = footballeronepanel.origin.y = 0;
        footballeronepanel.scale.y = 2.6;
        footballeronepanel.scale.x = 2.3;
//        footballeronepanel.x = (FlxG.width-footballeronepanel.width)*0.5;
//        footballeronepanel.y = (FlxG.height-footballeronepanel.height)*0.2;
        var effectjump = AssetsManager.getInstance().getSprite(0,0,"effect_ico_jump");
        var effectspeed = AssetsManager.getInstance().getSprite(0,0,"effect_ico_speed");
        var kick = AssetsManager.getInstance().getSprite(0,0,"btn_iko_kick");
        effectjump.x = 10;
        effectjump.y = 60;
        effectspeed.x = 10;
        effectspeed.y = 115;
        kick.x = 10;
        kick.y = 170;
        kick.origin.x = kick.origin.y = 0;
        kick.scale.x = kick.scale.y = 0.7;
        _propertygroup.add(kick);
        _propertygroup.add(effectspeed);
        _propertygroup.add(effectjump);


        refresh(_propertygroup);
        _propertygroup.x = X;
        _propertygroup.y = Y;
    }
    /*刷新球员属性*/
    private function refresh(_propertygroup:FlxSpriteGroup):Void
    {
        var effectjumpstatsbg = AssetsManager.getInstance().getSprite(0,0,"stats_bg");
        var effectjumpstatsprogress = AssetsManager.getInstance().getSprite(0,0,"stats_progress");
        var effectjumpstatsprogress2 = AssetsManager.getInstance().getSprite(0,0,"stats_progress2");
        var effectjumpstatsprogress3 = AssetsManager.getInstance().getSprite(0,0,"stats_progress3");
        effectjumpstatsbg.x = 105;
        effectjumpstatsprogress3.x = effectjumpstatsprogress.x = 108;
        effectjumpstatsbg.y =effectjumpstatsprogress3.y = effectjumpstatsprogress.y = 85;
        _propertygroup.add(effectjumpstatsbg);
        _propertygroup.add(effectjumpstatsprogress3);
        _propertygroup.add(effectjumpstatsprogress);

        var effectspeedstatsbg = AssetsManager.getInstance().getSprite(0,0,"stats_bg");
        var effectspeedstatsprogress = AssetsManager.getInstance().getSprite(0,0,"stats_progress");
        var effectspeedstatsprogress2 = AssetsManager.getInstance().getSprite(0,0,"stats_progress2");
        var effectspeedstatsprogress3 = AssetsManager.getInstance().getSprite(0,0,"stats_progress3");
        effectspeedstatsbg.x = 105;
        effectspeedstatsprogress3.x = effectspeedstatsprogress.x = 108;
        effectspeedstatsbg.y =effectspeedstatsprogress3.y = effectspeedstatsprogress.y = 140;
        _propertygroup.add(effectspeedstatsbg);
        _propertygroup.add(effectspeedstatsprogress3);
        _propertygroup.add(effectspeedstatsprogress);

        var kickstatsbg = AssetsManager.getInstance().getSprite(0,0,"stats_bg");
        var kickstatsprogress = AssetsManager.getInstance().getSprite(0,0,"stats_progress");
        var kickstatsprogress2 = AssetsManager.getInstance().getSprite(0,0,"stats_progress2");
        var kickstatsprogress3 = AssetsManager.getInstance().getSprite(0,0,"stats_progress3");
        kickstatsbg.x = 105;
        kickstatsprogress3.x = kickstatsprogress.x = 108;
        kickstatsbg.y =kickstatsprogress3.y = kickstatsprogress.y = 195;
        _propertygroup.add(kickstatsbg);
        _propertygroup.add(kickstatsprogress3);
        _propertygroup.add(kickstatsprogress);
//        initBuyBtn(effectjumpstatsprogress);
//        initBuyBtn(effectspeedstatsprogress);
//        initBuyBtn(kickstatsprogress);
    }


    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "back":
                            FlxG.switchState(new MenuState());
                        case "play":
                            FlxG.switchState(new PlayState());
                    }
            }
        }
    }

    public override function update():Void {
        super.update();
    }

}
