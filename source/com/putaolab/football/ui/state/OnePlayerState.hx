package com.putaolab.football.ui.state;
import com.putaolab.soccer.wiget.Body;
import com.putaolab.soccer.wiget.RightHand;
import com.putaolab.soccer.wiget.LeftHand;
import com.putaolab.football.ui.model.ModelReg;
import com.putaolab.football.ui.model.Model;
import component.PTFlxUIButton;
import flixel.FlxSprite;
import component.PTFlxUIState;
import flixel.group.FlxSpriteGroup;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;
import flixel.text.FlxText;

/**
 * User: gaoyun
 * Date: 14-5-27
 * Time: 下午1:51
 * description：
 */
class OnePlayerState extends PTFlxUIState{

    //body
    private var body:Body;
    private var rightHand:RightHand;
    private var leftHand:LeftHand;

    private var _back:PTFlxUIButton;
    private var _play:PTFlxUIButton;
    private var group:FlxSpriteGroup;
    //用来存放球员的group
    private var footballergroup:FlxSpriteGroup;
    //小组的数组下标用来取到小组里面的国家
    private var _index:Int;
    //当前选中的国家
    private var _selectedcountry:FlxSprite;
    //当前选中的国家名字
    private var _selectedcountryname:String;

    public function new(index:Int=-1):Void
    {
        super();
        if(index!=-1){
            _index = index;
        }
        if(ModelReg.getTeamAndCountry()!=null && index==-1){
            _selectedcountryname = ModelReg.getTeamAndCountry()[1];
            _index = ModelReg.getTeamAndCountry()[0];
        }
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
        initPropertyPanel();
        cursor.location = 0;
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
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play2");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = FlxG.width-_play.width-50;
        _play.y = FlxG.height - _play.height-40;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-40;
        group.add(_play);
        group.add(playicon);
    }

    /*
    * 根据小组id得到国家
    * */
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
            btnflagbg2.params= ["btnflagbg2",btnflagbg1,getFootballarFromCountry(countryarr[i]),countryarr[i]];
            btnflagbg2.loadGraphicsUpOverDown(countrbg2.getFlxFrameBitmapData());
            btnflagbg1.x = btnflagbg2.x = 50;
            btnflagbg1.y = btnflagbg2.y = 50+i*btnflagbg1.height;
            add(btnflagbg2);
            add(btnflagbg1);
            btnflagbg1.visible = false;
            if(i==0 && _selectedcountryname==null){//默认选中第一个国家
                _selectedcountry = btnflagbg1;
                _selectedcountry.visible = true;
                _selectedcountryname = countryarr[i];
                setFootBallerFormCountry(getFootballarFromCountry(countryarr[i]),countryarr[i].split("_")[1],countryarr[i].split("_")[1]);
            }
            if(_selectedcountryname == countryarr[i]){
                _selectedcountry = btnflagbg1;
                _selectedcountry.visible = true;
                setFootBallerFormCountry(getFootballarFromCountry(countryarr[i]),countryarr[i].split("_")[1],countryarr[i].split("_")[1]);
            }
            var country = AssetsManager.getInstance().getSprite(0,0,countryarr[i]);
            country.x = 66;
            country.y = 67+btnflagbg1.height*i;
            add(country);
        }
        ModelReg.saveTeamAndCountry(_index,_selectedcountryname);
    }

    /*得到每个国家的队员名*/
    private function getFootballarFromCountry(country:String):Array<Dynamic>
    {
        var footballerarr = Model.getInstance().getFootballarFromCountry(country);
        return footballerarr;
    }

    private var _countryballerarr:Array<Dynamic>;
    /*设置每个国家的队员*/
    private function setFootBallerFormCountry(?arr:Array<Dynamic>,body:String,hand:String ):Void
    {
        _countryballerarr = arr;
        if(arr==null){
            arr = [{head:"head_alves",name:"head_balotelli"}];
        }
        var len = arr.length;
        for(i in 0...len){
            var footballer = AssetsManager.getInstance().getSprite(0,0,arr[i].head);
            footballer.x = footballer.width*i;
            footballer.y = FlxG.height - (Reg.TEERAIN_DEEP+footballer.height);

            setFootBallerBody(footballer.x+(footballer.width-30)*0.5,footballer.y+footballer.height-12,body,hand);
//            initializeBody(body);
            footballergroup.add(footballer);
            if(arr[i].isclock==1){
                var lock = AssetsManager.getInstance().getSprite(0,0,"ico_lock");
                lock.x = footballer.width*i+30;
                lock.y = FlxG.height - (Reg.TEERAIN_DEEP+footballer.height)+100;
                footballergroup.add(lock);
            }
        }
        footballergroup.x = (FlxG.width-footballergroup.width)*0.5;
        if(_ballername != null){
            _ballername.text = _countryballerarr[0].name;
        }
    }

    private function initializeBody(country:String):Void{
        if(leftHand == null){
            leftHand = new LeftHand(0,0,country);
            footballergroup.add(leftHand);
        }
        if(rightHand == null){
            rightHand= new RightHand(0,0,country);
            footballergroup.add(rightHand);
        }
        if(body == null){
            body = new Body(0,0,country);
            footballergroup.add(body);
        }

    }

    /*
    *设置队员的身体
    * */
    private function setFootBallerBody(X:Float,Y:Float,body:String,hand:String):Void
    {
        var body = AssetsManager.getInstance().getSprite(0,0,"body_"+body);
        body.x = X;
        body.y = Y;
        footballergroup.add(body);
//        setFootBallerHand(body.x,body.y,hand);
    }

    /*
    *设置队员的手臂
    * */
    private function setFootBallerHand(X:Float,Y:Float,hand:String):Void
    {
        var hand = AssetsManager.getInstance().getSprite(0,0,"hand_"+hand);
        hand.x = X-35;
        hand.y = Y+35;
        footballergroup.add(hand);
    }

    private function setHandAnimation():Void
    {

    }

    private var _propertygroup:FlxSpriteGroup;
    private var _ballername:FlxText;
    /*设置球员属性面板*/
    private function initPropertyPanel():Void{
        if(_propertygroup==null){
            _propertygroup = new FlxSpriteGroup();
            add(_propertygroup);
        }
        var footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage1");
        _propertygroup.add(footballeronepanel);
        footballeronepanel.origin.x = footballeronepanel.origin.y = 0;
        footballeronepanel.scale.y = 2.6;
        footballeronepanel.scale.x = 2.3;
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

        _ballername = new FlxText(0,10,footballeronepanel.width*2.3,"dddd",20);
        _ballername.alignment = "center";
        _ballername.color = 0x000000;
        _ballername.text = _countryballerarr[0].name;
        _propertygroup.add(_ballername);

        refresh1();
        _propertygroup.x = (FlxG.width-footballeronepanel.width)*0.5;
        _propertygroup.y = (FlxG.height-footballeronepanel.height)*0.2;
    }
    /*刷新球员属性*/
    private function refresh1():Void
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
        initBuyBtn(effectjumpstatsprogress);
        initBuyBtn(effectspeedstatsprogress);
        initBuyBtn(kickstatsprogress);
    }

    private function initBuyBtn(?sp:FlxSprite):Void
    {
        var buy = AssetsManager.getInstance().getSprite(0,0,"btn_iko_buy");
        var buybtn = new PTFlxUIButton();
        buybtn.params = ["buybtn"];
        buybtn.loadGraphicsUpOverDown(buy.getFlxFrameBitmapData());
        buybtn.x = sp.x + sp.width + 15;
        buybtn.y = sp.y -20;
        _propertygroup.add(buybtn);
    }



    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "groups":
                            FlxG.switchState(new SelectTeamState());
                        case "buybtn":
//                            openSubState(new AllPopState());
                        case "play":
                            FlxG.switchState(new RankingState(_index,_selectedcountryname));
                        case "btnflagbg2":
                            if(_selectedcountry!=null){
                                _selectedcountry.visible = false;
                            }
                            params[1].visible = true;
                            _selectedcountry = params[1];
                            footballergroup.clear();
                            setFootBallerFormCountry(params[2],params[3].split("_")[1],params[3].split("_")[1]);
                            refresh1();
                            _selectedcountryname = params[3];
                            ModelReg.saveTeamAndCountry(_index,_selectedcountryname);
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
