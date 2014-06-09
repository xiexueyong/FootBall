package com.putaolab.football.ui.model;
/**
 * User: gaoyun
 * Date: 14-6-3
 * Time: 下午8:34
 * description：晋级赛中用到的数据
 */

class CompetitionModel {
    private static var _commodel:CompetitionModel;

    private var  _competitiondata:Array<Dynamic>;

    private var _sixteenarr:Array<Dynamic>;
    private var _eightarr:Array<Dynamic>;
    private var _fourarr:Array<Dynamic>;
    private var _twoarr:Array<Dynamic>;
    private var _threearr:Array<Dynamic>;
    private var _competitionstage:Int;

    private var _score1:String;
    private var _score2:String;
    private var _notfinal:Int;

    public function new() {
        _competitiondata = new Array<Dynamic>();
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


    public function getFinalsData():Void
    {
    }

    /*
    *随机十六强国家，目前存在国家重复问题
    * */
    public function randomSixtween(mycountry:String=""):Array<Dynamic>
    {
        if(ModelReg.getFinalsSixteen()!=null && ModelReg.getFinalsSixteen().length==16){
            _sixteenarr = ModelReg.getFinalsSixteen();
            return _sixteenarr;
        }
        if(_sixteenarr.length == 16){
            return _sixteenarr;
        }
        for(i in 0...8){
            var competition:CompetitionCountry;
            if(i==0 && mycountry!=""){
                competition = new CompetitionCountry();
                competition.country = mycountry;
                competition.score = "";
            }else{
                competition = new CompetitionCountry();
                competition.country = randomCountry(i);
                competition.score = "";
            }
            _sixteenarr.push(competition);
        }
        for(i in -7...1){
            var competition = new CompetitionCountry();
            competition.country = randomCountry(-i);
            competition.score = "";

            _sixteenarr.push(competition);
        }
        ModelReg.saveFinalsSixteen(_sixteenarr);
        return _sixteenarr;
    }
    public function randomCountry(index:Int):String
    {
        var countrys:Array<String> = Model.getInstance().getCountryFromTeam(index);
        var countryindex = Math.ceil(Math.random()*3);
        var len:Int = _sixteenarr.length;
        for(i in 0...len){
            if(countrys[countryindex] == _sixteenarr[i].country){
                randomCountry(index);
            }else{
                return countrys[countryindex];
            }
        }

        return countrys[countryindex];
    }

    /*
    *设置排行数据
    * */
    public function setTopData(score1:String,score2:String,?notfinal:Int):Void{
        _score1 = score1;
        _score2 = score2;
        _notfinal = notfinal;
        if(notfinal == 1){
            randomSixtween();
            setTopEight();
            setTopFour();
            setToptwo();
            setTopResult();
            return;
        }
        if(_score1>_score2){
            if(ModelReg.getCompetitionCtage()==Reg.sixtween){
                setTopEight();
            }
            if(ModelReg.getCompetitionCtage()==Reg.eight){
                setTopFour();
            }
            if(ModelReg.getCompetitionCtage()==Reg.four){
                setToptwo();
            }
            if(ModelReg.getCompetitionCtage()==Reg.two){
                setTopResult();
            }
        }
        if(_score1<=_score2){
            if(ModelReg.getCompetitionCtage()==Reg.sixtween){
                setTopEight();
                setTopFour();
                setToptwo();
                setTopResult();
            }
            if(ModelReg.getCompetitionCtage()==Reg.eight){
                setTopFour();
                setToptwo();
                setTopResult();
            }
            if(ModelReg.getCompetitionCtage()==Reg.four){
                setToptwo();
                setTopResult();
            }
            if(ModelReg.getCompetitionCtage()==Reg.two){
                setTopResult();
            }
        }
    }
    /*
    *设置八强数据国家没有比分、添加16强的比分
    * */
    public function setTopEight():Void
    {
        if(_eightarr == null){
            _eightarr = new Array<Dynamic>();
        }
        _sixteenarr = ModelReg.getFinalsSixteen();
        var len = _sixteenarr.length;
        for(i in 0...len){
            if(_score1>_score2 || ModelReg.getCompetitionCtage()==Reg.sixtween && _notfinal!=1){
                if(i==0){
                    _sixteenarr[i].score = _score1;
                }else if(i==1){
                    _sixteenarr[i].score = _score2;
                }else{
                    _sixteenarr[i].score = Math.ceil(Math.random()*7)+"";
                }
            }else{
                _sixteenarr[i].score = Math.ceil(Math.random()*7)+"";
            }

            if((i+1)%2==0){
                if(Std.parseInt(_sixteenarr[i].score) > Std.parseInt(_sixteenarr[i-1].score)){
                    var competition = new CompetitionCountry();
                    competition.country = _sixteenarr[i].country;
                    competition.score = "";
                    _eightarr.push(competition);
                }else{
                    var competition = new CompetitionCountry();
                    competition.country = _sixteenarr[i-1].country;
                    competition.score = "";
                    _eightarr.push(competition);
                }
            }
        }
//        trace("_eightarr.length : "+_eightarr.length);
        ModelReg.saveFinalsSixteen(_sixteenarr);
        ModelReg.saveFinalsEight(_eightarr);
    }
    public function getTopEight():Array<Dynamic>
    {
        _eightarr = ModelReg.getFinalsEight();
        return _eightarr;
    }
    /*
    *设置四强数据
    * */
    public function  setTopFour():Void
    {
        if(_fourarr == null){
            _fourarr = new Array<Dynamic>();
        }
        _eightarr = ModelReg.getFinalsEight();
        var len = _eightarr.length;
        for(i in 0...len){
            if(_score1>_score2 || ModelReg.getCompetitionCtage()==Reg.eight && _notfinal!=1){
                if(i==0){
                    _eightarr[i].score = _score1;
                }else if(i==1){
                    _eightarr[i].score = _score2;
                }else{
                    _eightarr[i].score = Math.ceil(Math.random()*7)+"";
                }
            }
            else{
                _eightarr[i].score = Math.ceil(Math.random()*7)+"";
            }
            if((i+1)%2==0){
                if(Std.parseInt(_eightarr[i].score) > Std.parseInt(_eightarr[i-1].score)){
                    var competition = new CompetitionCountry();
                    competition.country = _eightarr[i].country;
                    competition.score = "";
                    _fourarr.push(competition);
                }else{
                    var competition = new CompetitionCountry();
                    competition.country = _eightarr[i-1].country;
                    competition.score = "";
                    _fourarr.push(competition);
                }
            }
        }
        ModelReg.saveFinalsEight(_eightarr);
        ModelReg.saveFinalsFour(_fourarr);
    }
    public function getTopFour():Array<Dynamic>
    {
        _fourarr = ModelReg.getFinalsFour();
        return _fourarr;
    }
    /*
    *设置第一名、第二名数据
    * */
    public function setToptwo():Void
    {
        if(_twoarr == null){
            _twoarr = new Array<Dynamic>();
        }
        if(_threearr == null){
            _threearr = new Array<Dynamic>();
        }
        _fourarr = ModelReg.getFinalsFour();
        var len = _fourarr.length;
        for(i in 0...len){
            if(_score1>_score2 || ModelReg.getCompetitionCtage()==Reg.four && _notfinal!=1){
                if(i==0){
                    _fourarr[i].score = _score1;
                }else if(i==1){
                    _fourarr[i].score = _score2;
                }else{
                    _fourarr[i].score = Math.ceil(Math.random()*7)+"";
                }
            }else{
                _fourarr[i].score = Math.ceil(Math.random()*7)+"";
            }

            if((i+1)%2==0){
                if(Std.parseInt(_fourarr[i].score) > Std.parseInt(_fourarr[i-1].score)){
                    var competition = new CompetitionCountry();
                    competition.country = _fourarr[i].country;
                    competition.score = "";
                    _twoarr.push(competition);
                    var competition3 = new CompetitionCountry();
                    competition3.country = _fourarr[i-1].country;
                    competition3.score = "";
                    _threearr.push(competition3);
                }else{
                    var competition = new CompetitionCountry();
                    competition.country = _fourarr[i-1].country;
                    competition.score = "";
                    _twoarr.push(competition);
                    var competition3 = new CompetitionCountry();
                    competition3.country = _fourarr[i].country;
                    competition3.score = "";
                    _threearr.push(competition3);
                }
            }
        }
        ModelReg.saveFinalsFour(_fourarr);
        ModelReg.saveFinalsTwo(_twoarr);
        ModelReg.saveFinalsThree(_threearr);
    }
    public function getToptwo():Array<Dynamic>
    {
        trace(_twoarr);
        _twoarr = ModelReg.getFinalsTwo();
        return _twoarr;
    }
    /*
    *设置排名情况
    * */
    public function setTopResult():Void
    {
        _twoarr = ModelReg.getFinalsTwo();
        _threearr = ModelReg.getFinalsThree();
        if(_score1>_score2 || ModelReg.getCompetitionCtage()==Reg.two && _notfinal!=1){
            _twoarr[0].score = _score1;
            _twoarr[1].score = _score2;
            _threearr[0].score = Math.ceil(Math.random()*7)+"";
            _threearr[1].score = Math.ceil(Math.random()*7)+"";
        }
        else if(_score1<=_score2 || ModelReg.getCompetitionCtage()==Reg.two  && _notfinal!=1){
            _twoarr[0].score = Math.ceil(Math.random()*7)+"";
            _twoarr[1].score = Math.ceil(Math.random()*7)+"";
            _threearr[0].score = _score1;
            _threearr[1].score = _score2;
        }else{
            _twoarr[0].score = Math.ceil(Math.random()*7)+"";
            _twoarr[1].score = Math.ceil(Math.random()*7)+"";
            _threearr[0].score = Math.ceil(Math.random()*7)+"";
            _threearr[1].score = Math.ceil(Math.random()*7)+"";
            trace(_twoarr[0].score,_twoarr[1].score,_threearr[0].score,_threearr[1].score);
        }
    }

    /*
    *得到自己的排名
    * */
    public function getMyTop():Void{

    }

    /*
    *得到前三名数据
    * */
    public function getPreThree():Array<String>{
//        trace(_twoarr);
//        trace(_threearr);
        _twoarr = ModelReg.getFinalsTwo();
        _threearr = ModelReg.getFinalsThree();
        var prearr:Array<String> = new Array<String>();
        if(_twoarr[0].score > _twoarr[1].score){
            prearr.push(_twoarr[0].country.split("_")[1]);
            prearr.push(_twoarr[1].country.split("_")[1]);
        }else{
            prearr.push(_twoarr[1].country.split("_")[1]);
            prearr.push(_twoarr[0].country.split("_")[1]);
        }
        if(_threearr[0].score > _threearr[1].score){
            prearr.push(_threearr[0].country.split("_")[1]);
        }else{
            prearr.push(_threearr[1].country.split("_")[1]);
        }
        return prearr;
    }
    public function getTopthree():Array<Dynamic>
    {
        _threearr = ModelReg.getFinalsThree();
        return _threearr;
    }

}
class CompetitionCountry{
    public function new(){}
    public var country:String;
    public var score:String;
}