package com.putaolab.football.ui.state;
import flixel.FlxSprite;
import com.putaolab.football.ui.model.Model;
import component.PTFlxUIState;
import component.PTFlxUIButton;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
/**
 * User: gaoyun
 * Date: 14-6-2
 * Time: 上午10:34
 * description：国家小组旁行界面
 */

class RankingState extends PTFlxUIState{

    //对战记录y坐标起始位置
    private var competitionitemY:Float;
    //对战次数
    private var _competitionCount:Int;
    private var _toplayerone:PTFlxUIButton;
    private var _play:PTFlxUIButton;
    private var _index:Int;

    //当前选中的国家
    private var _selectedcountry:String;

    public function new(index:Int=0,?selectedcountry:Dynamic):Void
    {
        super();
        //得到缓存里面的信息
        _selectedcountry = selectedcountry;
        _index = index;
//        _competitionCount = Model.getInstance().getCompetition().length;
    }

    override public function create():Void
    {
        _makeCursor = true;

        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

        init();
    }

    /*
    *初始化
    * */
    private function init():Void{
        add(new StateBG());
        initButton();
        countryRamking();
    }

    /*
    * 初始化button
    * */
    private function initButton():Void
    {
        _toplayerone = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_toplayerone);
        _toplayerone.params = ["groups"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var icon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_player");
        _toplayerone.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _toplayerone.x = 50;
        _toplayerone.y = FlxG.height - _toplayerone.height-40;
        icon.x = 50;
        icon.y = FlxG.height - icon.height-40;
        add(_toplayerone);
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

    /*
    *第一次进入比赛没有排名的情况下默认为 0
    * */
    private function noRanking():Void
    {
        if(Model.getInstance().getTeamCountryScore() == null){
            var arr = Model.getInstance().getCountryFromTeam(_index);
            var len = arr.length;
            for(i in 0...len){
                Model.getInstance().setTeamCountryScore(arr[i],"0","0",i+"");
            }
        }
    }

    /*
    * 设置排名
    * */
    private function countryRamking():Void{
        noRanking();
        var _countryscorearr:Array<Dynamic> = Model.getInstance().getTeamCountryScore();
        var numdist = 13;
        for(i in 0...4){
//            trace(_countryscorearr[i].country,_countryscorearr[i].score,_countryscorearr[i].losescore,_countryscorearr[i].accumulativescore);
            var itemgroup = new FlxSpriteGroup();
            var sp;
            if(_countryscorearr[i].country == _selectedcountry){
                sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group2");
            }else{
                sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group1");
            }
            var bgbtn:PTFlxUIButton = new PTFlxUIButton();
            cursor.addWidget(bgbtn);
            bgbtn.loadGraphicsUpOverDown(sp.getFlxFrameBitmapData());
            bgbtn.origin.x =bgbtn.origin.y = 0;
            bgbtn.x = (FlxG.width-sp.width)*0.5;
            bgbtn.y= 80+i*(bgbtn.height +15);
            itemgroup.add(bgbtn);
            var number = AssetsManager.getInstance().getSprite(bgbtn.x + 10,bgbtn.y + numdist,(i+1)+"b");
            itemgroup.add(number);
            var country = AssetsManager.getInstance().getSprite(bgbtn.x + 50,bgbtn.y + 4,_countryscorearr[i].country);
            country.origin.x = country.origin.y = 0;
            country.scale.x = country.scale.y = 0.6;
            itemgroup.add(country);

            var colon = AssetsManager.getInstance().getSprite(bgbtn.x+bgbtn.width*0.5,bgbtn.y + numdist,"colonb");
            itemgroup.add(colon);
            if(_countryscorearr[i].score.charAt(1)!=""){
                var score1 = AssetsManager.getInstance().getSprite(colon.x -55,colon.y,_countryscorearr[i].score.charAt(0)+"b");
                itemgroup.add(score1);
                var score2 = AssetsManager.getInstance().getSprite(colon.x -40,colon.y,_countryscorearr[i].score.charAt(1)+"b");
                itemgroup.add(score2);
            }else{
                var score = AssetsManager.getInstance().getSprite(colon.x -40,colon.y,_countryscorearr[i].score+"b");
                itemgroup.add(score);
            }
            if(_countryscorearr[i].losescore.charAt(1)!=""){
                var losescore1 = AssetsManager.getInstance().getSprite(colon.x +20,colon.y,_countryscorearr[i].losescore.charAt(0)+"b");
                itemgroup.add(losescore1);
                var losescore2 = AssetsManager.getInstance().getSprite(colon.x +35,colon.y,_countryscorearr[i].losescore.charAt(1)+"b");
                itemgroup.add(losescore2);
            }else{
                var losescore = AssetsManager.getInstance().getSprite(colon.x +20,colon.y,_countryscorearr[i].losescore+"b");
                itemgroup.add(losescore);
            }
            competitionitemY = bgbtn.y+bgbtn.height;

            var accscore = AssetsManager.getInstance().getSprite(bgbtn.x+bgbtn.width -50,bgbtn.y + numdist,_countryscorearr[i].accumulativescore+"b");
            itemgroup.add(accscore);
            add(itemgroup);
        }

        competitionRecords();
    }


    /*
    * 对战结果记录
    * */
    private function competitionRecords():Void
    {
        if(Model.getInstance().getCompetition() == null){
            competitionItem(0,competitionitemY +30);
            competitionItem(0,competitionitemY + 100);
        }
        if(Model.getInstance().getCompetition()!=null && _competitionCount == 3){
            var comparr = Model.getInstance().getCompetition();
            for(i in 0...3){
//                competitionItem(0,competitionitemY +30+i*70,comparr.mycountry,comparr.competitioncountry,comparr.myscore,comparr.competitionscore);
            }
        }
    }
    private function competitionItem(X,Y,mycountry:String="flag_default",competitioncountry:String="flag_default",myscore:Int=0,competitionscore:Int=0):Void
    {
        var itemgroup = new FlxSpriteGroup();
        var sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group1");
//        sp.x= (FlxG.width-sp.width*1.45)*0.5;
//        sp.y= competitionitemY+20;
        itemgroup.add(sp);
        var mycountry = AssetsManager.getInstance().getSprite(sp.x+50,sp.y+4,mycountry);
        mycountry.origin.x = mycountry.origin.y = 0;
        mycountry.scale.x = mycountry.scale.y = 0.6;
        itemgroup.add(mycountry);
        var competitioncountry = AssetsManager.getInstance().getSprite(0,sp.y+4,competitioncountry);
        competitioncountry.x = sp.x+sp.width-competitioncountry.width;
        competitioncountry.origin.x = competitioncountry.origin.y = 0;
        competitioncountry.scale.x = competitioncountry.scale.y = 0.6;
        itemgroup.add(competitioncountry);

        add(itemgroup);
        itemgroup.x = (FlxG.width-sp.width)*0.5;
        itemgroup.y = Y;
    }


    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "groups":
                            FlxG.switchState(new OnePlayerState());
                        case "play":
                            FlxG.switchState(new FinalsState(_selectedcountry));

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
}
