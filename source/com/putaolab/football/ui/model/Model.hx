package com.putaolab.football.ui.model;


import openfl.utils.Int16Array;
import com.putaolab.football.ui.model.ModelReg;
import com.putaolab.football.ui.model.ModelReg;
import flixel.util.FlxSave;
import flixel.FlxG;
import flixel.util.FlxSave;
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
    //存储对战记录
    private var _competition:Array<Dynamic>;
    //一场比赛之后回到哪个界面 0小组排行 1晋级赛
    public static var resultprestate:Int = 0;
    //得分数组
    private var _scorearr:Array<String>;
    //我的国家现在累计的分数
    private var _myAccumulativeScore:Int;


    private var _mycountry:String;
    private var _competitioncountry:String;

    public static function getInstance():Model
    {
        if(_model==null){
            _model = new Model();
        }
        return _model;
    }

    public function new() {
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

    /*
    *    得到小组赛国家得分情况、以及比分情况
    */
    public function getTeamCountryScore():Array<Dynamic>
    {
        _countryscorearr = ModelReg.getRanking();
        return _countryscorearr;
    }
    public function getCountryAccumulativeScore():Int
    {
        return _myAccumulativeScore;
    }

    /*
    *   设置小组里面国家得分情况
    */
    public function setTeamCountryScore(country:String,score:String,losescore:String,accumulativescore:String):Void
    {
        if(ModelReg.getRanking() ==null || ModelReg.getRanking().length==0)
        {
            _countryscorearr = new Array<Dynamic>();
        }
        else{
            _countryscorearr = ModelReg.getRanking();
        }

        if(_countryscorearr.length ==4){
            var len = _countryscorearr.length;
            for(i in 0...len){
//                trace("_competitioncountry : "+_competitioncountry  +"_countryscorearr[i].country :"+_countryscorearr[i].country);
                if(_countryscorearr[i].country == _competitioncountry){
                    var loseaccumulativescore = "";
                    if(score>losescore){
                        loseaccumulativescore = 0+"";
                    }if(score<losescore){
                        loseaccumulativescore = 3+"";
                    }if(score==losescore){
                        loseaccumulativescore = 1+"";
                    }
                    _countryscorearr[i].score = Std.string(Std.parseInt(_countryscorearr[i].score)+Std.parseInt(losescore));
                    _countryscorearr[i].losescore = Std.string(Std.parseInt(_countryscorearr[i].losescore)+Std.parseInt(score));
                    _countryscorearr[i].accumulativescore = Std.string(Std.parseInt(_countryscorearr[i].accumulativescore)+Std.parseInt(loseaccumulativescore));
                }
                if(_countryscorearr[i].country == country){
//                    trace("score : "+score+"losescore : "+losescore+"accumulativescore: "+accumulativescore);
                    _countryscorearr[i].score = Std.string(Std.parseInt(_countryscorearr[i].score)+Std.parseInt(score));
                    _countryscorearr[i].losescore = Std.string(Std.parseInt(_countryscorearr[i].losescore)+Std.parseInt(losescore));
                    _countryscorearr[i].accumulativescore = Std.string(Std.parseInt(_countryscorearr[i].accumulativescore)+Std.parseInt(accumulativescore));
                    _myAccumulativeScore = Std.parseInt(_countryscorearr[i].accumulativescore);
                }
                if(_countryscorearr[i].country != _mycountry && _countryscorearr[i].country != _competitioncountry){
                    var randomscore = "";
                    var randomlosescore = "";
                    if(_scorearr !=null){
                        randomscore = _scorearr[1];
                        randomlosescore = _scorearr[0];
                    }
                    if(_scorearr ==null){
                        _scorearr = new Array<String>();
                        _scorearr[0] = Std.string(Math.ceil(Math.random()*5));
                        _scorearr[1] = Std.string(Math.ceil(Math.random()*5));
                        randomscore = _scorearr[0];
                        randomlosescore = _scorearr[1];
                    }
                    _countryscorearr[i].score = Std.string(Std.parseInt(_countryscorearr[i].score)+Std.parseInt(randomscore));
                    _countryscorearr[i].losescore = Std.string(Std.parseInt(_countryscorearr[i].losescore)+Std.parseInt(randomlosescore));
                    var ranaccumulativescore="";
                    if(randomscore>randomlosescore){
                        ranaccumulativescore = 3+"";
                    }if(randomscore<randomlosescore){
                        ranaccumulativescore = 0+"";
                    }if(randomscore==randomlosescore){
                        ranaccumulativescore = 1+"";
                    }
                    _countryscorearr[i].ranaccumulativescore = Std.string(Std.parseInt(_countryscorearr[i].ranaccumulativescore)+Std.parseInt(ranaccumulativescore));
                }
            }
        }
        else{
            _countryscore = new Countryscore();
            _countryscore.country = country;
            _countryscore.score = score;
            _countryscore.losescore = losescore;
            _countryscore.accumulativescore = accumulativescore;
            _countryscorearr.push(_countryscore);
        }
        if(_countryscorearr!=null && _countryscorearr.length!=0){
            var len = _countryscorearr.length;
            for(i in 0...len){
                for(j in 0...len-1){
                    var temp;
                    if(_countryscorearr[i].accumulativescore>_countryscorearr[j].accumulativescore){
                        temp = _countryscorearr[i];
                        _countryscorearr[i] = _countryscorearr[j];
                        _countryscorearr[j] = temp;
                    }
                }
            }
        }
        _scorearr = null;
        ModelReg.saveRanking(_countryscorearr);
    }

    /*
    *球员
    * isclock 1被锁 0未锁
    * */
    public function initCountryBaller(head:String="head_default",name:String="name",chinaname="chinaname",isclock:Int=1):Void
    {
        if(_countryballer==null){
            _countryballer = new Array<Dynamic>();
        }
        var countryBaller = new CountryBaller();
        countryBaller.head = head;
        countryBaller.name = name;
        countryBaller.chinaname = chinaname;
        countryBaller.isclock = isclock;
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
    public function setCompetition(mycountry:String,competitioncountry:String,myscore:String,competitionscore:String):Void
    {
        _mycountry = mycountry;
        _competitioncountry = competitioncountry;
//        if(_competition == null){
        if(ModelReg.getCompetition() == null || ModelReg.getCompetition().length ==0){
            _competition = new Array<Competition>();
        }else{
            _competition = ModelReg.getCompetition();
        }
        trace(_competition);
        var competition = new Competition();
        competition.mycountry = mycountry;
        competition.competitioncountry = competitioncountry;
        competition.myscore = myscore;
        competition.competitionscore = competitionscore;

        _competition.push(competition);
        //将数据缓存起来
        ModelReg.saveCompetition(_competition);
    }

    /*
    *得到小组对战记录
    * */
    public function getCompetition():Array<Dynamic>
    {
        if(ModelReg.getCompetition() != null){
            _competition = ModelReg.getCompetition();
        }
        return _competition;
    }

}
//国家得分情况
class Countryscore{
    public function new(){
    }
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
    //球员中文名字
    public var chinaname:String;
    //球员是否被锁
    public var isclock:Int;
}
//设置国家里面的球员
class Country{
    public function new(){}
    public var countryballer:Array<Dynamic>;
    public var body:String;
    public var hand:String;
    public var countryname:String;
}
//对战记录
class Competition
{
    public function new(){}
    public var mycountry:String;
    public var competitioncountry:String;
    public var myscore:String;
    public var competitionscore:String;
}