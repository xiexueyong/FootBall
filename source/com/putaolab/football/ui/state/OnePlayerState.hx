package com.putaolab.football.ui.state;
import com.putaolab.football.ui.model.Model;
import component.PTFlxUIButton;
import flixel.FlxSprite;
import component.PTFlxUIState;
import flixel.group.FlxSpriteGroup;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;

/**
 * User: gaoyun
 * Date: 14-5-27
 * Time: 下午1:51
 * description：
 */
class OnePlayerState extends PTFlxUIState{

    private var _back:PTFlxUIButton;
    private var _play:PTFlxUIButton;
    private var group:FlxSpriteGroup;
    //用来存放球员的group
    private var footballergroup:FlxSpriteGroup;
    //小组的数组下标用来取到小组里面的国家
    private var _index:Int;
    //当前选中的国家
    private var _selectedcountry:FlxSprite;

    public function new(index:Int=0):Void
    {
        super();
        _index = index;
    }

    override public function create():Void
    {
        _makeCursor = true;
        footballergroup = new FlxSpriteGroup();
        group = new FlxSpriteGroup();
        add(group);
        add(footballergroup);
        group.y = 10;
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

        init();
        setCountry();
    }

    /*初始化背景*/
    public function init():Void
    {
        group.add(new StateBG());
        initButton();
    }

    /*初始化按钮*/
    private function initButton():Void
    {
        _back = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_back);
        _back.params = ["groups"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var backicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_groups");
        _back.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _back.x = 50;
        _back.y = FlxG.height - _back.height-40;
        backicon.x = 50;
        backicon.y = FlxG.height - backicon.height-40;
        group.add(_back);
        group.add(backicon);

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
        group.add(_play);
        group.add(playicon);
    }

    /*根据小组id得到国家*/
    public function setCountry():Void
    {
        var countryarr = Model.getInstance().getCountryFromTeam(_index);
        var countrylen = countryarr.length;
        for(i in 0...countrylen){
            var countrbg1 = AssetsManager.getInstance().getSprite(0,0,"btn_flag_bg1");
            var countrbg2 = AssetsManager.getInstance().getSprite(0,0,"btn_flag_bg2");
            var btnflagbg1 = new PTFlxUIButton();
            btnflagbg1.loadGraphicsUpOverDown(countrbg1.getFlxFrameBitmapData());

            var btnflagbg2 = new PTFlxUIButton();
            cursor.addWidget(btnflagbg2);
            btnflagbg2.params= ["btnflagbg2",btnflagbg1,getFootballarFromCountry(countryarr[i])];
            btnflagbg2.loadGraphicsUpOverDown(countrbg2.getFlxFrameBitmapData());
            btnflagbg1.x = btnflagbg2.x = 50;
            btnflagbg1.y = btnflagbg2.y = 140+i*btnflagbg1.height;
            add(btnflagbg2);
            add(btnflagbg1);
            btnflagbg1.visible = false;
            var country = AssetsManager.getInstance().getSprite(0,0,countryarr[i]);
            country.x = 60;
            country.y = 150+btnflagbg1.height*i;
//            trace(countryarr[i]+"DDD"+country);
            add(country);

            setFootBallerFormCountry();
            initPropertyPanel();
        }
    }

    /*得到每个国家的队员名*/
    private function getFootballarFromCountry(country:String):Array<String>
    {
        var footballerarr = ["head_balotelli"];
        return footballerarr;
    }

    /*设置每个国家的队员*/
    private function setFootBallerFormCountry(?arr:Array<String> ):Void
    {
        if(arr==null){
            arr = ["head_alves","head_balotelli"];
        }
        var len = arr.length;
        for(i in 0...len){
            var footballer = AssetsManager.getInstance().getSprite(0,0,arr[i]);
            footballer.x = (FlxG.width-footballer.width-50)*0.5+footballer.width*i;
            footballer.y = FlxG.height - (Reg.TEERAIN_DEEP+footballer.height);


            setFootBallerBody(footballer.x+(footballer.width-28)*0.5,footballer.y+footballer.height-8);
            footballergroup.add(footballer);
        }
    }

    private function setFootBallerBody(X:Float,Y:Float):Void
    {
        var body = AssetsManager.getInstance().getSprite(0,0,"body_algeria");
        body.x = X;
        body.y = Y;
        footballergroup.add(body);
//        setFootBallerHand(body.x,body.y);
    }

    private function setFootBallerHand(X:Float,Y:Float):Void
    {
        var hand = AssetsManager.getInstance().getSprite(0,0,"hand_algeria");
        hand.x = X;
        hand.y = Y;
        footballergroup.add(hand);
    }

    private function setHandAnimation():Void
    {

    }

    /*设置球员属性面板*/
    private function initPropertyPanel():Void{
        var footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage1");
        add(footballeronepanel);
        footballeronepanel.scale.y = 2.5;
        footballeronepanel.scale.x = 2.5;
        footballeronepanel.x = (FlxG.width-footballeronepanel.width)*0.5;
        footballeronepanel.y = (FlxG.height-footballeronepanel.height)*0.5;
        var effectjump = AssetsManager.getInstance().getSprite(0,0,"effect_ico_jump");
        var effectspeed = AssetsManager.getInstance().getSprite(0,0,"effect_ico_speed");
        var kick = AssetsManager.getInstance().getSprite(0,0,"btn_iko_kick");
        effectjump.x = (FlxG.width-240)*0.5;
        effectjump.y = (FlxG.height-140)*0.5;
        effectspeed.x = (FlxG.width-240)*0.5;
        effectspeed.y = (FlxG.height-40)*0.5;
        kick.x = (FlxG.width-240)*0.5;
        kick.y = (FlxG.height+60)*0.5;
        add(kick);
        add(effectspeed);
        add(effectjump);

        refresh1();
    }
    /*刷新球员属性*/
    private function refresh1():Void
    {
        var statsbg = AssetsManager.getInstance().getSprite(0,0,"stats_bg");
        var statsprogress = AssetsManager.getInstance().getSprite(0,0,"stats_progress");
        var statsprogress2 = AssetsManager.getInstance().getSprite(0,0,"stats_progress2");
        var statsprogress3 = AssetsManager.getInstance().getSprite(0,0,"stats_progress3");
        add(statsbg);
        add(statsprogress3);
        add(statsprogress);
        statsbg.x = (FlxG.width-44)*0.5;
        statsprogress3.x = statsprogress.x = (FlxG.width-40)*0.5;
        statsbg.y =statsprogress3.y = statsprogress.y = (FlxG.height-100)*0.5;

        var statsbg = AssetsManager.getInstance().getSprite(0,0,"stats_bg");
        var statsprogress = AssetsManager.getInstance().getSprite(0,0,"stats_progress");
        var statsprogress2 = AssetsManager.getInstance().getSprite(0,0,"stats_progress2");
        var statsprogress3 = AssetsManager.getInstance().getSprite(0,0,"stats_progress3");
        add(statsbg);
        add(statsprogress3);
        add(statsprogress);
        statsbg.x = (FlxG.width-44)*0.5;
        statsprogress3.x = statsprogress.x = (FlxG.width-40)*0.5;
        statsbg.y =statsprogress3.y = statsprogress.y = (FlxG.height)*0.5;

        var statsbg = AssetsManager.getInstance().getSprite(0,0,"stats_bg");
        var statsprogress = AssetsManager.getInstance().getSprite(0,0,"stats_progress");
        var statsprogress2 = AssetsManager.getInstance().getSprite(0,0,"stats_progress2");
        var statsprogress3 = AssetsManager.getInstance().getSprite(0,0,"stats_progress3");
        add(statsbg);
        add(statsprogress3);
        add(statsprogress);
        statsbg.x = (FlxG.width-44)*0.5;
        statsprogress3.x = statsprogress.x = (FlxG.width-40)*0.5;
        statsbg.y =statsprogress3.y = statsprogress.y = (FlxG.height+100)*0.5;
    }



    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "groups":
                            FlxG.switchState(new SelectTeamState());
                        case "play":
                            FlxG.switchState(new PlayState());
                        case "btnflagbg2":
                            if(_selectedcountry!=null){
                                _selectedcountry.visible = false;
                            }
                            params[1].visible = true;
                            _selectedcountry = params[1];
                            footballergroup.clear();
                            setFootBallerFormCountry(params[2]);
                            refresh1();
                    }
                case "over_button":
                    switch(cast(params[0], String)) {
                        case "btnflagbg2":
                            params[1].visible = true;
                    }
                case "out_button":
                    switch(cast(params[0], String)) {
                        case "btnflagbg2":
                            params[1].visible = false;
                    }
            }
            if(_selectedcountry!=null){
                _selectedcountry.visible = true;
            }
        }
    }

    /*当选中其他国家时取消国家的选中状态*/
    private function cancelSelect():Void{

    }

    public override function update():Void {
        super.update();
    }

}
