package com.putaolab.football.ui.state;

import com.putaolab.football.ui.model.ModelReg;
import com.putaolab.football.ui.model.CompetitionModel;
import com.putaolab.football.ui.model.Model;
import flixel.FlxSprite;
import component.PTFlxUIState;
import component.PTFlxUIButton;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxPoint;

/**
 * User: gaoyun
 * Date: 14-6-2
 * Time: 下午12:22
 * description：游戏决赛界面球队晋级情况
 */

class FinalsState extends PTFlxUIState{
    private var _toranking:PTFlxUIButton;
    private var _play:PTFlxUIButton;
    private var _kostage:PTFlxUIButton;
    //当前选中的国家
    private var _selectedcountry:String;

    public function new(?selectcountry:Dynamic) {
        super();
        _selectedcountry =  ModelReg.getTeamAndCountry()[1];
    }

    override public function create():Void
    {
        _makeCursor = true;
        add(new StateBG());
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);
        init();
        cursor.location = 0;
    }

    /**/
    private function init():Void{
        initButton();
        PromotionRamking();
    }
    /*
    * 初始化button
    * */
    private function initButton():Void
    {
        _toranking = new PTFlxUIButton(0,0,null);
        _toranking.params = ["groups"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var icon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_groupstats");
        _toranking.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _toranking.x = 50;
        _toranking.y = FlxG.height - _toranking.height-10;
        cursor.addWidget(_toranking);
        icon.x = 50;
        icon.y = FlxG.height - icon.height-10;
        add(_toranking);
        add(icon);

        _play = new PTFlxUIButton(0,0,null);
        _play.params = ["play"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play2");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = FlxG.width-_play.width-50;
        _play.y = FlxG.height - _play.height-10;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-10;
        add(_play);
        add(playicon);

        _kostage = new PTFlxUIButton(0,0,null);
        _kostage.params = ["kostage"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var winscreen = AssetsManager.getInstance().getSprite(0,0,"btn_iko_winscreen");
        _kostage.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _kostage.x = FlxG.width-_kostage.width-50;
        _kostage.y = FlxG.height - _kostage.height-10;
        winscreen.x = FlxG.width-winscreen.width-50;
        winscreen.y = FlxG.height - winscreen.height-10;
        add(_kostage);
        add(winscreen);
        if(ModelReg.getGameStatus()==1){
            _kostage.visible = true;
            winscreen.visible = true;
            _play.visible = false;
            playicon.visible = false;
        }else{
            _kostage.visible = false;
            winscreen.visible = false;
            _play.visible = true;
            playicon.visible = true;
        }
        cursor.addWidget(_play);
        cursor.addWidget(_kostage);
    }

    /*
     * 对战国家面板
     * country1、country2 对战的两个国家
     * */
    private function getVersusCountry(X:Float,Y:Float,country1:String="flag_default",country2:String="flag_default",score1:String="",score2:String=""):FlxSpriteGroup
    {
        var versusgroup = new FlxSpriteGroup();
        var footballeronepanel:FlxSprite;
//        if(_selectedcountry == country1 || _selectedcountry == country2){
        if(_selectedcountry == country1){
            footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage2");
        }else{
            footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage1");
        }
        if(_selectedcountry == country1 && score1<score2){
        footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage3");
        }
        versusgroup.add(footballeronepanel);
        var country1 = AssetsManager.getInstance().getSprite(0,0,country1);
        var country2 = AssetsManager.getInstance().getSprite(0,0,country2);
        country1.origin.x = country1.origin.y = country2.origin.x = country2.origin.y = 0;
        country1.scale.x = country1.scale.y = country2.scale.x = country2.scale.y = 0.5;
        country1.x = 5;
        country2.x = 90;
        country1.y = country2.y = 8;
        versusgroup.add(country1);
        versusgroup.add(country2);

        var colon = AssetsManager.getInstance().getSprite(footballeronepanel.width*0.5-10,60,"colonb");
        versusgroup.add(colon);
        if(score1==null || score2==null || score1=="" || score2==""){
            var score1 = AssetsManager.getInstance().getSprite(0,0,"minusb");
            var score2 = AssetsManager.getInstance().getSprite(0,0,"minusb");
            score1.x = 28;
            score2.x = 105;
            score1.y = score2.y = 62;
            versusgroup.add(score1);
            versusgroup.add(score2);
        }else{
            if(score1.charAt(1)!=""){
                var scoreindex1 = AssetsManager.getInstance().getSprite(40,68,score1.charAt(1)+"b");
                var scoreindex0 = AssetsManager.getInstance().getSprite(51,68,score1.charAt(0)+"b");
                scoreindex1.origin.x = scoreindex1.origin.y = scoreindex0.origin.x = scoreindex0.origin.y = 0;
                scoreindex1.scale.x = scoreindex1.scale.y = scoreindex0.scale.x = scoreindex0.scale.y = 0.6;
                versusgroup.add(scoreindex1);
                versusgroup.add(scoreindex0);
            }else{
                var score1 = AssetsManager.getInstance().getSprite(40,68,score1+"b");
                score1.origin.x = score1.origin.y  = 0;
                score1.scale.x = score1.scale.y =0.6;
                versusgroup.add(score1);
            }
            if(score2.charAt(1)!=""){
                var scoreindex1 = AssetsManager.getInstance().getSprite(118,68,score2.charAt(1)+"b");
                var scoreindex0 = AssetsManager.getInstance().getSprite(102,68,score2.charAt(0)+"b");
                scoreindex1.origin.x = scoreindex1.origin.y = scoreindex0.origin.x = scoreindex0.origin.y = 0;
                scoreindex1.scale.x = scoreindex1.scale.y = scoreindex0.scale.x = scoreindex0.scale.y = 0.6;
                versusgroup.add(scoreindex1);
                versusgroup.add(scoreindex0);
            }else{
                var score2 = AssetsManager.getInstance().getSprite(102,68,score2+"b");
                score2.origin.x = score2.origin.y  = 0;
                score2.scale.x = score2.scale.y =0.6;
                versusgroup.add(score2);
            }
        }
        add(versusgroup);
        versusgroup.x = X;
        versusgroup.y = Y;
        return versusgroup;
    }


    private var _matchcountry:String;
    /*
    *根据国家名字得到可以用的球员
    * */
    public function getBallerFromCountry(countryname:String):String{
        var ballerarr = Model.getInstance().getFootballarFromCountry(countryname);
        trace(ballerarr);
        var len = ballerarr.length;
        for(i in 0...len){
            if(ballerarr[i].isclock == 0){
                return ballerarr[i].head;
            }
        };

        return null;
    }

    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "groups":
                            FlxG.switchState(new RankingState());
                        case "kostage":
                            FlxG.switchState(new ResultState());
                        case "play":
                            Model.resultprestate = 0;
                            if(ModelReg.getCompetitionCtage() == 0){
                                ModelReg.saveCompetitionCtage(Reg.sixtween);
                            }else{
                                ModelReg.saveCompetitionCtage(Std.int(ModelReg.getCompetitionCtage()/2));
                            }

                            trace(_sixteenarr[1].country);
                            _matchcountry = _sixteenarr[1].country;
                            FlxG.switchState(new PlayState(getBallerFromCountry(_matchcountry),_matchcountry.split("_")[1],getBallerFromCountry(_selectedcountry),_selectedcountry.split("_")[1]));
                    }
                case "over_button":
                    switch(cast(params[0], String)) {
                        case "btnflagbg2":
                            params[1].visible = true;
                    }
                case "out_button":
            }
        }
    }

    private var _sixteenarr:Array<Dynamic>;
    private var _eightarr:Array<Dynamic>;
    private var _fourarr:Array<Dynamic>;
    private var _twoarr:Array<Dynamic>;
    private var _threearr:Array<Dynamic>;
    private var _competitionstage:Int;

    /* */
    private function PromotionRamking():Void
    {
        initsixtween();
        initeight();
        initfour();
        inittwo(555,230);
        initthree(555,460);
        initTrophy(580,100,"pohar_gold");
        initTrophy(580,345,"pohar_bronze",0.8);
    }

    private function initTrophy(X:Float,Y:Float,trophy:String,?scale:Float=1):Void
    {
        var trophy = AssetsManager.getInstance().getSprite(X,Y,trophy);
        trophy.scale.x = trophy.scale.y = scale;
        add(trophy);
    }

    private function initsixtween():Void
    {
        var sixtweenpos:Array<FlxPoint> = [new FlxPoint(50,20),new FlxPoint(50,150),new FlxPoint(50,330),new FlxPoint(50,460),new FlxPoint(1080,20),new FlxPoint(1080,150),new FlxPoint(1080,330),new FlxPoint(1080,460)];
        if(_sixteenarr == null){
            _sixteenarr = CompetitionModel.getInstance().randomSixtween(_selectedcountry);
        }

        var i:Int = 0;
        while(i<_sixteenarr.length){
//            trace(sixtweenpos[Std.int(i/2)].x,sixtweenpos[Std.int(i/2)].y);
            getVersusCountry(sixtweenpos[Std.int(i/2)].x,sixtweenpos[Std.int(i/2)].y,_sixteenarr[i].country,_sixteenarr[i+1].country,_sixteenarr[i].score,_sixteenarr[i+1].score);//,_sixteenarr[i].country,_sixteenarr[i+1].country
            i = i+2;
        }
    }
    private function initeight():Void
    {
        var eightpos:Array<FlxPoint> = [new FlxPoint(240,90),new FlxPoint(240,385),new FlxPoint(890,90),new FlxPoint(890,385)];
//        trace("_eightarr : " + CompetitionModel.getInstance().getTopEight());
        _eightarr = CompetitionModel.getInstance().getTopEight();

        if(_eightarr==null || _eightarr.length==0){
            var i:Int = 0;
            while(i<8){
                getVersusCountry(eightpos[Std.int(i/2)].x,eightpos[Std.int(i/2)].y);
                i = i+2;
            }
        }else{
            var i:Int = 0;
            while(i<_eightarr.length){
                getVersusCountry(eightpos[Std.int(i/2)].x,eightpos[Std.int(i/2)].y,_eightarr[i].country,_eightarr[i+1].country,_eightarr[i].score,_eightarr[i+1].score);
                i = i+2;
            }
        }

    }
    private function initfour():Void
    {
        var fourpos:Array<FlxPoint> = [new FlxPoint(280,240),new FlxPoint(860,240)];
        _fourarr = CompetitionModel.getInstance().getTopFour();
        if(_fourarr==null || _fourarr.length==0){
            var i:Int = 0;
            while(i<4){
                getVersusCountry(fourpos[Std.int(i/2)].x,fourpos[Std.int(i/2)].y);
                i = i+2;
            }
        }else{
            var i:Int = 0;
            while(i<_fourarr.length){
                getVersusCountry(fourpos[Std.int(i/2)].x,fourpos[Std.int(i/2)].y,_fourarr[i].country,_fourarr[i+1].country,_fourarr[i].score,_fourarr[i+1].score);
                i = i+2;
            }
        }

    }
    private function inittwo(X:Float,Y:Float):Void
    {
        _twoarr = CompetitionModel.getInstance().getToptwo();
        if(_twoarr==null || _twoarr.length==0){
            var i:Int = 0;
            while(i<2){
                getVersusCountry(X,Y);
                i = i+2;
            }
        }else{
            var i:Int = 0;
            while(i<_twoarr.length){
                getVersusCountry(X,Y,_twoarr[i].country,_twoarr[i+1].country,_twoarr[i].score,_twoarr[i+1].score);
                i = i+2;
            }
        }
    }
    private function initthree(X:Float,Y:Float):Void
    {
        _threearr = CompetitionModel.getInstance().getTopthree();
        if(_threearr==null || _threearr.length==0){
            var i:Int = 0;
            while(i<32){
                getVersusCountry(X,Y);
                i = i+2;
            }
        }else{
            var i:Int = 0;
            while(i<_threearr.length){
                getVersusCountry(X,Y,_threearr[i].country,_threearr[i+1].country,_threearr[i].score,_threearr[i+1].score);
                i = i+2;
            }
        }
    }
}
