package com.putaolab.football.ui.model;

import flixel.util.FlxSave;
import flixel.FlxG;
/**
 * User: gaoyun
 * Date: 14-5-28
 * Time: 上午11:58
 * description：
 */

class Model {
    private static var _model:Model;

    public var teamarr:Array<Array<String>>;
    public static var gameSave:FlxSave;


    public static function SaveScore(score:Int):Void
    {
        if(gameSave == null){
            gameSave = new FlxSave();
        }
        gameSave.bind("score");
    }
    public static function getInstance():Model
    {
        if(_model==null){
            _model = new Model();
        }
        return _model;
    }


    public function new() {
//        var teamobj = new teamObj();
//        teamobj.name = "";
//        teamobj.country = "";
//        _shareobj = new SharedObject();
        teamarr = new Array<Array<String>>();
        teamData();
    }

    private function teamData():Void{
//    <SubTexture name="flag_germany" x="809" y="765" width="91" height="58"/>
        var A = ["flag_algeria","flag_argentina","flag_australia","flag_belgium"];
        var B = ["flag_bosniaandherzegovina","flag_brazil","flag_cameroon","flag_chile"];
        var C = ["flag_colombia","flag_costarica","flag_cotedivoire","flag_croatia"];
        var D = ["flag_germany","flag_ecuador","flag_england","flag_france"];
        var E = ["flag_usa","flag_uruguay","flag_switzerland","flag_spain"];
        var F = ["flag_russia","flag_portugal","flag_nigeria","flag_netherlands"];
        var G = ["flag_mexico","flag_korea","flag_japan","flag_italy"];
        var H = ["flag_iran","flag_honduras","flag_greece","flag_ghana"];
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

    /*根据小组Id得到小组里面的国家*/
    public function getCountryFromTeam(index:Int):Array<String>
    {
        saveTeamInformation();
        getTeamformation();
       return teamarr[index];
    }


    public function saveTeamInformation():Void
    {
//        FlxG.save();
        trace("eeeeeeeeee");
//        _shareobj.setProperty("ss","ddddddddddddffffffffff");
    }

    public function getTeamformation():Void
    {

        trace("getTeamformation");

    }



}
//typedef teamObj = {
//    var name:String;
//    var country:Array<String>;
//}