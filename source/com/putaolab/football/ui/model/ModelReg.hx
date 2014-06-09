package com.putaolab.football.ui.model;
import flixel.util.FlxSave;

/**
 * User: gaoyun
 * Date: 14-6-4
 * Time: 下午8:45
 * description：数据缓存
 */

class ModelReg {
    public static var gameSave:FlxSave;
    private var _competitionstage:Int;
    public function new() {
    }

    /*
    *保存上次选择的小组和国家
    * */
    public static function saveTeamAndCountry(teamindex:Int,country:String):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("place");
        if(gameSave.data.place == null){
            gameSave.data.place = [teamindex,country];
        }else{
            gameSave.data.place = [teamindex,country];
            gameSave.flush();
        }

    }
    public static function getTeamAndCountry():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("place");
        return gameSave.data.place;
    }


    /*
    *保存小组排行数据
    * */
    public static function saveRanking(countryscore:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("rank");
        gameSave.data.rank = countryscore;
        gameSave.flush();
    }
    public static function getRanking():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("rank");
        return gameSave.data.rank;
    }
    /*
    *保存小组对战数据
    * */
    public static function saveCompetition(comparr:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("competition");
        gameSave.data.competition = comparr;
        gameSave.flush();
    }
    public static function getCompetition():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("competition");
        return gameSave.data.competition;
    }

    /*
    *保存晋级赛数据16
    * */
    public static function saveFinalsSixteen(finalsixteen:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finalsixteen");
        gameSave.data.finalsixteen = finalsixteen;
        gameSave.flush();
    }
    public static function getFinalsSixteen():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finalsixteen");
        return gameSave.data.finalsixteen;
    }
    /*
    *保存晋级赛数据8
    * */
    public static function saveFinalsEight(finaleight:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finaleight");
        gameSave.data.finaleight = finaleight;
        gameSave.flush();
    }
    public static function getFinalsEight():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finaleight");
        return gameSave.data.finaleight;
    }
    /*
    *保存晋级赛数据4
    * */
    public static function saveFinalsFour(finalfour:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finalfour");
        gameSave.data.finalfour = finalfour;
        gameSave.flush();
    }
    public static function getFinalsFour():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finalfour");
        return gameSave.data.finalfour;
    }
    /*
    *保存晋级赛数据2
    * */
    public static function saveFinalsTwo(finaltwo:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finaltwo");
        gameSave.data.finaltwo = finaltwo;
        gameSave.flush();
    }
    public static function getFinalsTwo():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finaltwo");
        return gameSave.data.finaltwo;
    }
    /*
    *保存晋级赛数据3,4
    * */
    public static function saveFinalsThree(finalthree:Array<Dynamic>):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finalthree");
        gameSave.data.finalthree = finalthree;
        gameSave.flush();
    }
    public static function getFinalsThree():Array<Dynamic>
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("finalthree");
        return gameSave.data.finalthree;
    }
    /*
    *晋级赛进程
    * */
    public static function saveCompetitionCtage(competitionstage:Int):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("CompetitionCtage");
        gameSave.data.CompetitionCtage = competitionstage;
        gameSave.flush();
    }
    public static function getCompetitionCtage():Int
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("CompetitionCtage");
        return gameSave.data.CompetitionCtage;
    }

    public static function clearData():Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("place");
        gameSave.data.place=null;
        gameSave.bind("rank");
        gameSave.data.rank=null;
        gameSave.bind("competition");
        gameSave.data.competition=null;

        gameSave.bind("CompetitionCtage");
        gameSave.data.CompetitionCtage=null;
        gameSave.bind("finaleight");
        gameSave.data.finaleight=null;
        gameSave.bind("finalsixteen");
        gameSave.data.finalsixteen=null;
        gameSave.bind("finalfour");
        gameSave.data.finalfour=null;
        gameSave.bind("finaltwo");
        gameSave.data.finaltwo=null;
        gameSave.bind("finalthree");
        gameSave.data.finalthree=null;
    }

    /*
    *清除比赛数据重新开始
    * */
    public static function cleardataRestart():Void{
        gameSave.bind("rank");
        gameSave.data.rank=null;
        gameSave.bind("competition");
        gameSave.data.competition=null;
        gameSave.bind("CompetitionCtage");
        gameSave.data.CompetitionCtage=null;
        gameSave.bind("finaleight");
        gameSave.data.finaleight=null;
        gameSave.bind("finalsixteen");
        gameSave.data.finalsixteen=null;
        gameSave.bind("finalfour");
        gameSave.data.finalfour=null;
        gameSave.bind("finaltwo");
        gameSave.data.finaltwo=null;
        gameSave.bind("finalthree");
        gameSave.data.finalthree=null;
    }
}
