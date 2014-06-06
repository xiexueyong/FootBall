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
        return gameSave.data.competition;
    }
    /*
    *保存晋级赛数据
    * */
    public static function saveFinals():Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("fianl");
        gameSave.data.fianl = "";
        gameSave.flush();
    }

    public static function clearData():Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.destroy;
    }
}
