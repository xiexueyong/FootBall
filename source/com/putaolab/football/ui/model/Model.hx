package com.putaolab.football.ui.model;


import flixel.util.FlxSave;
import flixel.FlxG;
/**
 * User: gaoyun
 * Date: 14-5-28
 * Time: 上午11:58
 * description：游戏处理
 */

class Model {
    private static var _model:Model;
    //存放国家里面的球员数据
    private var _countrys:Array<Dynamic>;
    //存放球员头像
    private var _countryballer:Array<Dynamic>;
    //国家得分情况
    private var _countryscore:Countryscore;
    //存放小组每个国家得分
    private var _countryscorearr:Array<Dynamic>;
    //存放小组数据
    public var teamarr:Array<Array<String>>;

    public static var gameSave:FlxSave;


    public static function getInstance():Model
    {
        if(_model==null){
            _model = new Model();
        }
        return _model;
    }

    public static function SaveScore(score:Int):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("score");
    }

    public function new() {
//        var teamobj = new teamObj();
//        teamobj.name = "";
//        teamobj.country = "";
//        _shareobj = new SharedObject();
        new AssistModel(this);
        teamarr = new Array<Array<String>>();
        teamData();

    }

    /*
    * 小组数据
    * */
    private function teamData():Void{
        var A = ["flag_brazil","flag_croatia","flag_mexico","flag_cameroon"];
        var B = ["flag_spain","flag_netherlands","flag_chile","flag_australia"];
        var C = ["flag_colombia","flag_greece","flag_cotedivoire","flag_japan"];
        var D = ["flag_uruguay","flag_costarica","flag_england","flag_italy"];
        var E = ["flag_switzerland","flag_ecuador","flag_france","flag_honduras"];
        var F = ["flag_argentina","flag_bosniaandherzegovina","flag_iran","flag_nigeria"];
        var G = ["flag_germany","flag_portugal","flag_ghana","flag_usa"];
        var H = ["flag_belgium","flag_algeria","flag_russia","flag_korea"];
        teamarr.push(A);
        teamarr.push(B);
        teamarr.push(C);
        teamarr.push(D);
        teamarr.push(E);
        teamarr.push(F);
        teamarr.push(G);
        teamarr.push(H);
    }

    private function countryFootballer():Void
    {

    }

    public function getTeamData():Array<Array<String>>{
        return teamarr;
    }

    /*
    *    根据小组Id得到小组里面的国家
    */
    public function getCountryFromTeam(index:Int):Array<String>
    {
        return teamarr[index];
    }


    public function saveTeamInformation():Void
    {
//        FlxG.save();
//        _shareobj.setProperty("ss","ddddddddddddffffffffff");
    }

    public function getTeamformation():Void
    {

    }

    /*
    *    得到小组赛国家得分情况、以及比分情况
    */
    public function getTeamCountryScore():Array<Dynamic>
    {
        return _countryscorearr;
    }

    /*
    *   设置小组里面国家得分情况
    */
    public function setTeamCountryScore(country:String,score:String,losescore:String,accumulativescore:String):Void
    {
        _countryscore = new Countryscore();

        if(_countryscorearr == null)
        {
            _countryscorearr = new Array<Dynamic>();
        }

        _countryscore.country = country;
        _countryscore.score = score;
        _countryscore.losescore = losescore;
        _countryscore.accumulativescore = accumulativescore;
        _countryscorearr.push(_countryscore);
    }
    /*
    *球员头像
    * */
    public function initCountryBaller(head:String="head_default",name:String="name"):Void
    {
        if(_countryballer==null){
            _countryballer = new Array<Dynamic>();
        }
        var countryBaller = new CountryBaller();
        countryBaller.head = head;
        countryBaller.name = name;
        _countryballer.push(countryBaller);
    }
    public function getCountryBallers():Array<Dynamic>{
        return _countryballer;
    }
    /*
    *    初始化国家都包含球员和身体
    */
    public function initCountrys(body:String="head_default",hand:String="hand_default",countryname:String="countryname",countryballer:Array<Dynamic>):Void
    {
        if(_countrys==null){
            _countrys = new Array<Dynamic>();
        }
        var country = new Country();
        country.body = body;
        country.hand = hand;
        country.countryname = countryname;
        country.countryballer = countryballer;

        _countrys.push(country);
        _countryballer = null;
    }

    /*
    * 根据国家得到球员
    * */
    public function getFootballarFromCountry(country:String):Array<Dynamic>
    {
        var len = _countrys.length;
        for(i in 0...len){
            if(country == _countrys[i].countryname){
                return _countrys[i].countryballer;
            }
        }
        return null;
    }

    /*
    * 设置小组对战记录
    * */
    public function setCompetition(mycountry:String,competitioncountry:String,myscore:Int,competitionscore:Int):Void
    {
        if(_competition == null){
            _competition = new Array<Dynamic>();
        }
        var competition = new Competition();
        competition.mycountry = mycountry;
        competition.competitioncountry = competitioncountry;
        competition.myscore = myscore;
        competition.competitionscore = competitionscore;

        _competition.push(competition);
    }

    /*
    *得到小组对战记录
    * */
    public function getCompetition():Array<Dynamic>
    {
        return _competition;
    }

    private var _competition:Array<Dynamic>;
}
//国家得分情况
class Countryscore{
    public function new(){}
    //国家
    public var country:String;
    //得分
    public var score:String;
    //丢失的分数
    public var losescore:String;
    //累积分
    public var accumulativescore:String;
}
//设置每个球员
class CountryBaller{
    public function new(){}
    //球员名
    public var name:String;
    //头像名字
    public var head:String;
}
//设置国家里面的球员
class Country{
    public function new(){}
    public var countryballer:Array<Dynamic>;
    public var body:String;
    public var hand:String;
    public var countryname:String;
//    public var countryname:String;
}
//对战记录
class Competition
{
    public function new(){}
    public var mycountry:String;
    public var competitioncountry:String;
    public var myscore:Int;
    public var competitionscore:Int;
}