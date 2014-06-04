package com.putaolab.football.ui.model;
/**
 * User: gaoyun
 * Date: 14-6-3
 * Time: 下午8:34
 * description：晋级赛中用到的数据
 */

class CompetitionModel {
    private static var _commodel:CompetitionModel;

    private var _sixteenarr:Array<Dynamic>;
    private var _eightarr:Array<Dynamic>;
    private var _fourarr:Array<Dynamic>;
    private var _twoarr:Array<Dynamic>;
    private var _competitionstage:Int;

    public function new() {
        _sixteenarr = new Array<Dynamic>();
        _eightarr = new Array<Dynamic>();
        _fourarr = new Array<Dynamic>();
        _twoarr = new Array<Dynamic>();
    }

    public static function getInstance():CompetitionModel
    {
        if(_commodel==null){
            _commodel = new CompetitionModel();
        }
        return _commodel;
    }

    /*
    *随机十六强国家，目前存在国家重复问题
    * */
    public function randomSixtween():Array<Dynamic>
    {
        for(i in 0...8){
            var competition = new CompetitionCountry();
            competition.country = randomCountry(i);
            competition.score = 0;

            _sixteenarr.push(competition);
        }
        for(i in -7...1){
            var competition = new CompetitionCountry();
            competition.country = randomCountry(-i);
            competition.score = 0;

            _sixteenarr.push(competition);
        }
        return _sixteenarr;
    }
    public function randomCountry(index:Int):String
    {
        var countrys:Array<String> = Model.getInstance().getCountryFromTeam(index);
        var countryindex = Math.ceil(Math.random()*3);

        return countrys[countryindex];
    }

}
class CompetitionCountry{
    public function new(){}
    public var country:String;
    public var score:Int;
}