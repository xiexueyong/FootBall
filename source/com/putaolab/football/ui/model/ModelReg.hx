package com.putaolab.football.ui.model;
import flixel.util.FlxSave;

/**
 * User: gaoyun
 * Date: 14-6-4
 * Time: 下午8:45
 * description：
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
            gameSave = FlxSave();
        }
        gameSave.bind("place");
        gameSave.data.place = [teamindex,country];
        gameSave.flush();
    }

    /*
    *保存小组排行数据
    * */
    public static function saveRanking():Void
    {
        if(gameSave == null){
            gameSave = FlxSave();
        }
        gameSave.bind("rank");
        gameSave.data.place = [teamindex,country];
        gameSave.flush();
    }
    /*
    *保存小组对战数据
    * */
    public static function saveCompetition():Void
    {
        if(gameSave == null){
            gameSave = FlxSave();
        }
        gameSave.bind("competition");
        gameSave.data.place = [teamindex,country];
        gameSave.flush();
    }
    /*
    *保存晋级赛数据
    * */
    public static function saveFinals():Void
    {
        if(gameSave == null){
            gameSave = FlxSave();
        }
        gameSave.bind("competition");
        gameSave.data.place = [teamindex,country];
        gameSave.flush();
    }

    public static function clearData():Void
    {
        if(gameSave == null){
            gameSave = FlxSave();
        }
        gameSave.destroy
    }
}
