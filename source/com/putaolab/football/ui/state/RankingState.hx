package com.putaolab.football.ui.state;
import flixel.FlxBasic;
import com.putaolab.football.ui.model.ModelReg;
import com.putaolab.football.ui.model.Model;
import flixel.FlxSprite;
import com.putaolab.football.ui.model.Model;
import component.PTFlxUIState;
import component.PTFlxUIButton;
import flixel.addons.ui.FlxUICursor;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;

/**
 * User: gaoyun
 * Date: 14-6-2
 * Time: 上午10:34
 * description：国家小组旁行界面
 */

class RankingState extends PTFlxUIState{

    private var itemgroup:FlxSpriteGroup;
    private var competitionitemgroup:FlxSpriteGroup;
    //对战记录y坐标起始位置
    private var competitionitemY:Float;
    //对战次数
    private var _competitionCount:Int;
    //我的累计得分
    private var _accumulativescore:Int;
    private var _toplayerone:PTFlxUIButton;
    private var _finals:PTFlxUIButton;
    private var finalicon:FlxSprite;
    private var _play:PTFlxUIButton;
    private var playicon:FlxSprite;
    //小组index
    private var _index:Int;
    //当前选中的国家
    private var _selectedcountry:String;
    private var _matchcountry:String;

    public function new(index:Int=0,?selectedcountry:Dynamic):Void
    {
        super();
        //得到缓存里面的信息
        if(ModelReg.getTeamAndCountry() == null){
            _selectedcountry = selectedcountry;
            _index = index;
        }else{
            _selectedcountry = ModelReg.getTeamAndCountry()[1];
            _index = ModelReg.getTeamAndCountry()[0];
        }

        if(Model.getInstance().getCompetition()!=null){
            _competitionCount = Model.getInstance().getCompetition().length;
        }
    }

    override public function create():Void
    {
        add(new StateBG());
        _makeCursor = true;
        itemgroup = new FlxSpriteGroup();
        add(itemgroup);
        competitionitemgroup = new FlxSpriteGroup();
        add(competitionitemgroup);

        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);
        init();
        cursor.location = 0;
    }
    /*
    *初始化
    * */
    private function init():Void{
//        add(new StateBG());
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
        _toplayerone.params = ["oneplayer"];
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
        playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play2");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = FlxG.width-_play.width-50;
        _play.y = FlxG.height - _play.height-40;
        playicon.x = FlxG.width-playicon.width-50;
        playicon.y = FlxG.height - playicon.height-40;
        add(_play);
        add(playicon);

        _finals = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_finals);
        _finals.params = ["finals"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        finalicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_kostage");
        _finals.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _finals.x = FlxG.width-_finals.width-50;
        _finals.y = FlxG.height - _finals.height-40;
        finalicon.x = FlxG.width-finalicon.width-50;
        finalicon.y = FlxG.height - finalicon.height-40;
        add(_finals);
        add(finalicon);
        _finals.visible = false;
        finalicon.visible = false;
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
                Model.getInstance().setTeamCountryScore(arr[i],"0","0","0");
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
            var sp;
            if(_countryscorearr[i].country == _selectedcountry){
                _accumulativescore = _countryscorearr[i].accumulativescore;
                sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group2");
            }else{
                sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group1");
            }
            var bgbtn:PTFlxUIButton = new PTFlxUIButton();
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
        if(Model.getInstance().getCompetition() != null &&  _competitionCount<3){
            var comparr = Model.getInstance().getCompetition();
            trace(comparr[0].mycountry,comparr[0].competitioncountry,comparr[0].myscore,comparr[0].competitionscore);
            for(i in 0..._competitionCount){
                competitionItem(0,competitionitemY +30+i*70,comparr[i].mycountry,comparr[i].competitioncountry,comparr[i].myscore,comparr[i].competitionscore);
            }
            if(_competitionCount == 1){
                competitionItem(0,competitionitemY +100);
            }
        }
        if(Model.getInstance().getCompetition()!=null && _competitionCount >= 3){
            //如果赢了或者已经结束晋级赛
            if(_accumulativescore>=6 || ModelReg.getGameStatus()==1){
                _play.visible = false;
                playicon.visible = false;
                _finals.visible = true;
                finalicon.visible = true;
            }
            var comparr = Model.getInstance().getCompetition();
            for(i in 0...3){
                trace(comparr[i].mycountry,comparr[i].competitioncountry,comparr[i].myscore,comparr[i].competitionscore);
                competitionItem(0,competitionitemY +30+i*70,comparr[i].mycountry,comparr[i].competitioncountry,comparr[i].myscore,comparr[i].competitionscore);
            }
        }
    }
    private function competitionItem(X,Y,mycountry:String="flag_default",competitioncountry:String="flag_default",myscore:String="0",competitionscore:String="0"):Void
    {
        var numdist = 13;
        var sp = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_group1");
        sp.x= (FlxG.width-sp.width)*0.5;
        sp.y= Y;
        competitionitemgroup.add(sp);
        var mycountry = AssetsManager.getInstance().getSprite(sp.x+50,sp.y+4,mycountry);
        mycountry.origin.x = mycountry.origin.y = 0;
        mycountry.scale.x = mycountry.scale.y = 0.6;
        competitionitemgroup.add(mycountry);
        var competitioncountry = AssetsManager.getInstance().getSprite(0,sp.y+4,competitioncountry);
        competitioncountry.x = sp.x+sp.width-competitioncountry.width;
        competitioncountry.origin.x = competitioncountry.origin.y = 0;
        competitioncountry.scale.x = competitioncountry.scale.y = 0.6;
        competitionitemgroup.add(competitioncountry);

        var colon = AssetsManager.getInstance().getSprite(sp.x+sp.width*0.5,sp.y + numdist,"colonb");
        competitionitemgroup.add(colon);
        if(myscore.charAt(1)!=""){
            var score1 = AssetsManager.getInstance().getSprite(colon.x -58,colon.y,myscore.charAt(0)+"b");
            competitionitemgroup.add(score1);
            var score2 = AssetsManager.getInstance().getSprite(colon.x -40,colon.y,myscore.charAt(1)+"b");
            competitionitemgroup.add(score2);
        }else{
            var score = AssetsManager.getInstance().getSprite(colon.x -40,colon.y,myscore+"b");
            competitionitemgroup.add(score);
        }
        if(competitionscore.charAt(1)!=""){
            var losescore1 = AssetsManager.getInstance().getSprite(colon.x +20,colon.y,competitionscore.charAt(0)+"b");
            competitionitemgroup.add(losescore1);
            var losescore2 = AssetsManager.getInstance().getSprite(colon.x +38,colon.y,competitionscore.charAt(1)+"b");
            competitionitemgroup.add(losescore2);
        }else{
            var losescore = AssetsManager.getInstance().getSprite(colon.x +20,colon.y,competitionscore+"b");
            competitionitemgroup.add(losescore);
        }
//        competitionitemgroup.x = (FlxG.width-sp.width)*0.5;
//        competitionitemgroup.y = Y;
    }


    /*
    *得到可以对战的国家
    * */
    public function getMatchCountry():Void{

        var allcountry:Array<String> = Model.getInstance().getCountryFromTeam(_index);
        var matchcountry:Array<Dynamic> = Model.getInstance().getCompetition();
        if(matchcountry == null){
            var alllen = allcountry.length;
            for(i in 0...alllen)
            {
                if(allcountry[i]!= _selectedcountry){
                    _matchcountry = allcountry[i];
                    return;
                }
            }
        }
        else{
            var alllen = allcountry.length;
            var matchlen = matchcountry.length;

            var tempAllCountry = allcountry.slice(0);
            for(i in 0...matchlen)
            {
                var item = matchcountry[i];
                var cc:String = item.competitioncountry;
                var index = tempAllCountry.indexOf(cc);
                tempAllCountry.splice(index,1);
            }
            var comption:String;
            for(i in 0...tempAllCountry.length)
            {
                if(tempAllCountry[i] != _selectedcountry){
                    _matchcountry = tempAllCountry[i];
                }
            }
        }
    }

    /*
    *根据国家名字得到可以用的球员
    * */
    public function getBallerFromCountry(countryname:String):String{
        var ballerarr = Model.getInstance().getFootballarFromCountry(countryname);
        var len = ballerarr.length;
        for(i in 0...len){
            if(ballerarr[i].isclock == 0){
                return ballerarr[i].head;
            }
        };
        trace("return null");
        return null;
    }


    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "oneplayer":
                            FlxG.switchState(new OnePlayerState());
                        case "finals":
                            FlxG.switchState(new FinalsState(_selectedcountry));
                        case "play":
                            Model.resultprestate = _competitionCount+1;
                            getMatchCountry();
                            trace(getBallerFromCountry(_matchcountry),_matchcountry,getBallerFromCountry(_selectedcountry),_selectedcountry);
                            FlxG.switchState(new PlayState(getBallerFromCountry(_matchcountry),_matchcountry.split("_")[1],getBallerFromCountry(_selectedcountry),_selectedcountry.split("_")[1]));
                    }
            }
        }
    }
}
