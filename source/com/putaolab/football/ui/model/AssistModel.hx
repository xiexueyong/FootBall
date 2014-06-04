package com.putaolab.football.ui.model;
/**
 * User: gaoyun
 * Date: 14-6-3
 * Time: 上午11:06
 * description：辅助Model填写静态数据
 */

class AssistModel {

    private var _model:Model;


    public function new(model:Model) {
        _model = model;
        initAllCountry();
    }

    public function initAllCountry():Void
    {
        //A组
        //flag_brazil
        _model.initCountryBaller("head_neymar","Yeman");
        _model.initCountryBaller("head_hulk","Hurd");
        _model.initCountryBaller("head_carlos","Bobby Carl");
        _model.initCountryBaller("head_zico","Z Boy");
        _model.initCountryBaller("head_ronaldinho","Rollie");
        _model.initCountryBaller("head_ronaldo2","Rogny");
        _model.initCountryBaller("head_pele","Peter");
        _model.initCountrys("body_brazil","hand_brazil","flag_brazil",_model.getCountryBallers());
        //flag_croatia
        _model.initCountryBaller("head_modric","Luke Morris");
        _model.initCountrys("body_croatia","hand_croatia","flag_croatia",_model.getCountryBallers());
        //flag_mexico
        _model.initCountryBaller("head_hernandez","Javy Herman");
        _model.initCountryBaller("head_blanco","Carl Black");
        _model.initCountrys("body_mexico","hand_mexico","flag_mexico",_model.getCountryBallers());
        //flag_cameroon
        _model.initCountryBaller("head_eto","Sammy Elthon");
        _model.initCountrys("body_cameroon","hand_cameroon","flag_cameroon",_model.getCountryBallers());
        //B组
        //flag_spain
        _model.initCountryBaller("head_puyol","Charles Pujols");
        _model.initCountryBaller("head_iniesta","Andres Siniestra");
        _model.initCountryBaller("head_raul","ROY");
        _model.initCountryBaller("head_villa","Daniel Vilnius");
        _model.initCountrys("body_spain","hand_spain","flag_spain",_model.getCountryBallers());
        //flag_netherlands
        _model.initCountryBaller("head_vanpersie","Bobby var perser");
        _model.initCountryBaller("head_plago","Plago");
        _model.initCountryBaller("head_davids","David");
        _model.initCountrys("body_netherlands","hand_netherlands","flag_netherlands",_model.getCountryBallers());
        //flag_chile
        _model.initCountryBaller("head_vidal","Arthur Vivaldi");
        _model.initCountrys("body_chile","hand_chile","flag_chile",_model.getCountryBallers());
        //flag_australia
        _model.initCountryBaller("head_neill","Luke Neilson");
        _model.initCountryBaller("head_chipperfield","Sam Chipmunk");
        _model.initCountrys("body_australia","hand_australia","flag_australia",_model.getCountryBallers());

//        _model.initCountryBaller("head_modric","Luke Morris");
//        _model.initCountrys("body_brazil","hand_brazil","flag_brazil",_model.getCountryBallers);
//        _model.initCountrys("body_brazil","hand_brazil","flag_brazil",_model.getCountryBallers);
//        _model.initCountrys("body_brazil","hand_brazil","flag_brazil",_model.getCountryBallers);
    }
}
