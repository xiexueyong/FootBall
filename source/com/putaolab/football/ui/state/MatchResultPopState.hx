package com.putaolab.football.ui.state;
import com.putaolab.football.ui.model.CompetitionModel;
import flixel.addons.ui.FlxUICursor;
import component.PTFlxUISubState;
import com.putaolab.football.ui.model.CompetitionModel;
import com.putaolab.football.ui.model.ModelReg;
import com.putaolab.football.ui.model.Model;
import component.PTFlxUIButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUISubState;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;

class MatchResultPopState extends PTFlxUISubState
{
    private var _restart:PTFlxUIButton;
    private var _play:PTFlxUIButton;
    private var _leftCountry:String;
    private var _rightCountry:String;

    //leftName  rightName
    private var leftName:String;
    private var rightName:String;

    private var _leftFlag:String;
    private var _rightFlag:String;
    private var _scores:Array<Int>;

    public function new(liftname,rightname,leftCountry:String,rightCountry:String,scores:Array<Int>){
        super();
        leftName = liftname;
        rightName = rightname;
        _leftCountry = leftCountry;
        _rightCountry = rightCountry;

        _leftFlag = "flag_"+leftCountry;
        _rightFlag = "flag_"+rightCountry;
        _scores = scores;
    }
	public override function create():Void
	{
        _makeCursor = true;
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

        initButton();
//        trace(_leftCountry,_rightCountry,Std.string(_scores[0]),Std.string(_scores[1]));
        getVersusCountry(_leftFlag,_rightFlag,Std.string(_scores[0]),Std.string(_scores[1]));

        cursor.location = 0;
	}

    /*
    * 初始化button
    * */
    private function initButton():Void
    {
        _restart = new PTFlxUIButton(0,0,null);
//        cursor.addWidget(_restart);
        _restart.params = ["restart"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var icon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_restart");
        _restart.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _restart.x = icon.x = 400;
        _restart.y = icon.y = 550;
        add(_restart);
        add(icon);
        cursor.addWidget(_restart);

        _play = new PTFlxUIButton(0,0,null);
//        cursor.addWidget(_play);
        _play.params = ["play"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play");
        _play.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _play.x = playicon.x= 800;
        _play.y = playicon.y = 550;
        add(_play);
        add(playicon);
        cursor.addWidget(_play);
    }
    /*
     * 对战国家面板
     * country1、country2 对战的两个国家
     *   X:Float,Y:Float,country1:String="flag_default",country2:String="flag_default",score1:String="",score2:String=""
     * */
    private function getVersusCountry(country1:String="flag_default",country2:String="flag_default",score1:String="",score2:String=""):FlxSpriteGroup
    {
        var versusgroup = new FlxSpriteGroup();
        var footballeronepanel = AssetsManager.getInstance().getSprite(0,0,"podklad_ko_stage1");
        footballeronepanel.origin.x = footballeronepanel.origin.y  = 0;
        footballeronepanel.scale.x  =3.12;
        footballeronepanel.scale.y = 2.5;
        versusgroup.add(footballeronepanel);
        var country1 = AssetsManager.getInstance().getSprite(0,0,country1);
        var country2 = AssetsManager.getInstance().getSprite(0,0,country2);
        country1.origin.x = country1.origin.y = country2.origin.x = country2.origin.y = 0;
        country1.scale.x = country1.scale.y = country2.scale.x = country2.scale.y = 0.9;
        country1.x = 60;
        country2.x = 345;
        country1.y = country2.y = 34;
        versusgroup.add(country1);
        versusgroup.add(country2);

        var colon = AssetsManager.getInstance().getSprite(260,55,"colonb");
        colon.origin.x = colon.origin.y  = 0;
        colon.scale.x = colon.scale.y =0.4;
        versusgroup.add(colon);
        if(score1==null || score2==null || score1=="" || score2==""){
            var score1 = AssetsManager.getInstance().getSprite(0,0,"0b");
            var score2 = AssetsManager.getInstance().getSprite(0,0,"0b");
            score1.x = 28;
            score2.x = 105;
            score1.y = score2.y = 50;
            versusgroup.add(score1);
            versusgroup.add(score2);
        }else{
            if(score1.charAt(1)!=""){
                var scoreindex1 = AssetsManager.getInstance().getSprite(236,50,score1.charAt(1)+"b");
                var scoreindex0 = AssetsManager.getInstance().getSprite(220,50,score1.charAt(0)+"b");
                scoreindex1.origin.x = scoreindex1.origin.y = scoreindex0.origin.x = scoreindex0.origin.y = 0;
                scoreindex1.scale.x = scoreindex1.scale.y = scoreindex0.scale.x = scoreindex0.scale.y = 0.6;
                versusgroup.add(scoreindex1);
                versusgroup.add(scoreindex0);
            }else{
                var score1 = AssetsManager.getInstance().getSprite(220,50,score1+"b");
                score1.origin.x = score1.origin.y  = 0;
                score1.scale.x = score1.scale.y =0.6;
                versusgroup.add(score1);
            }
            if(score2.charAt(1)!=""){
                var scoreindex1 = AssetsManager.getInstance().getSprite(296,50,score2.charAt(1)+"b");
                var scoreindex0 = AssetsManager.getInstance().getSprite(280,50,score2.charAt(0)+"b");
                scoreindex1.origin.x = scoreindex1.origin.y = scoreindex0.origin.x = scoreindex0.origin.y = 0;
                scoreindex1.scale.x = scoreindex1.scale.y = scoreindex0.scale.x = scoreindex0.scale.y = 0.6;
                versusgroup.add(scoreindex1);
                versusgroup.add(scoreindex0);
            }else{
                var score2 = AssetsManager.getInstance().getSprite(280,50,score2+"b");
                score2.origin.x = score2.origin.y  = 0;
                score2.scale.x = score2.scale.y =0.6;
                versusgroup.add(score2);
            }
        }
        add(versusgroup);
        versusgroup.x = (FlxG.width-versusgroup.width)*0.5;
        FlxTween.tween(versusgroup,{ x: (FlxG.width-versusgroup.width)*0.5, y: 150 },0.5,{ complete: onComplete, type: FlxTween.ONESHOT });
        return versusgroup;
    }

    public function onComplete(t:FlxTween):Void
    {
        var arrow = AssetsManager.getInstance().getSprite(0,0,"btn_iko_arrow");
        arrow.angle = 90;
        arrow.x = 810;
        add(arrow);
        FlxTween.tween(arrow,{ x: 800, y: 450 },0.3);
    }

    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "restart":
                            FlxG.switchState(new PlayState(leftName,_leftCountry,rightName,_rightCountry));
                        case "play":
                            if(ModelReg.getCompetitionCtage()== 2){
                                FlxG.switchState(new ResultState());
                                ModelReg.saveGameStatus(1);
                                CompetitionModel.getInstance().setMyTop();
                                return;
                            }
                            if(Model.resultprestate == 0){
                                CompetitionModel.getInstance().setTopData(Std.string(_scores[1]),Std.string(_scores[0]));
                                if(_scores[1]>_scores[0]){
                                    FlxG.switchState(new FinalsState());
                                }else{
                                    FlxG.switchState(new ResultState());
                                    ModelReg.saveGameStatus(1);
                                    CompetitionModel.getInstance().setMyTop();
                                }
                            }else {
                                var accumulativescore:Int = 0;
                                if(_scores[1]>_scores[0]){
                                    accumulativescore = 3;
                                }if(_scores[1]<_scores[0]){
                                    accumulativescore = 0;
                                }if(_scores[1]==_scores[0]){
                                    accumulativescore = 1;
                                }
                                Model.getInstance().setCompetition(_rightFlag,_leftFlag,Std.string(_scores[1]),Std.string(_scores[0]));
                                Model.getInstance().setTeamCountryScore(_rightFlag,Std.string(_scores[1]),Std.string(_scores[0]),Std.string(accumulativescore));
                                if(Model.resultprestate == 3 ){
                                    var myAccumulativeScore:Int = Model.getInstance().getCountryAccumulativeScore();
                                    if(myAccumulativeScore>=6){
                                        FlxG.switchState(new RankingState());
                                    }else{
                                        CompetitionModel.getInstance().setTopData(Std.string(_scores[1]),Std.string(_scores[0]),1);
                                        FlxG.switchState(new ResultState());
                                        ModelReg.saveGameStatus(1);
                                        CompetitionModel.getInstance().setMyTop();
                                    }
                                }else{
                                    FlxG.switchState(new RankingState());
                                }
                            }
                    }
            }
        }
    }
}