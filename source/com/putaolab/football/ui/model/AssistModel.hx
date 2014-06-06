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
        _model.initCountryBaller("head_neymar","Yeman","内马尔");
        _model.initCountryBaller("head_hulk","Hurd","浩克",0);
        _model.initCountryBaller("head_carlos","Bobby Carl","卡洛斯");
        _model.initCountryBaller("head_zico","Z Boy","济科");
        _model.initCountryBaller("head_ronaldinho","Rollie","罗纳尔多迪尼奥");
        _model.initCountryBaller("head_ronaldo2","Rogny","罗纳尔多");
        _model.initCountryBaller("head_pele","Peter","贝利");
        _model.initCountrys("body_brazil","hand_brazil","flag_brazil",_model.getCountryBallers());
        //flag_croatia
        _model.initCountryBaller("head_modric","Luke Morris","莫德里奇",0);
        _model.initCountrys("body_croatia","hand_croatia","flag_croatia",_model.getCountryBallers());
        //flag_mexico
        _model.initCountryBaller("head_hernandez","Javy Herman","赫尔南德斯",0);
        _model.initCountryBaller("head_blanco","Carl Black","布兰科");
        _model.initCountrys("body_mexico","hand_mexico","flag_mexico",_model.getCountryBallers());
        //flag_cameroon
        _model.initCountryBaller("head_eto","Sammy Elthon","埃托奥",0);
        _model.initCountrys("body_cameroon","hand_cameroon","flag_cameroon",_model.getCountryBallers());
        //B组
        //flag_spain
        _model.initCountryBaller("head_puyol","Charles Pujols","普约尔");
        _model.initCountryBaller("head_iniesta","Andres Siniestra","伊涅斯塔",0);
        _model.initCountryBaller("head_raul","ROY","劳尔");
        _model.initCountryBaller("head_villa","Daniel Vilnius","丹尼尔");
        _model.initCountrys("body_spain","hand_spain","flag_spain",_model.getCountryBallers());
        //flag_netherlands
        _model.initCountryBaller("head_vanpersie","Bobby var perser","范佩西");
        _model.initCountryBaller("head_plago","Plago","",0);
        _model.initCountryBaller("head_davids","David","戴维斯");
        _model.initCountrys("body_netherlands","hand_netherlands","flag_netherlands",_model.getCountryBallers());
        //flag_chile
        _model.initCountryBaller("head_vidal","Arthur Vivaldi","比达尔",0);
        _model.initCountrys("body_chile","hand_chile","flag_chile",_model.getCountryBallers());
        //flag_australia
        _model.initCountryBaller("head_neill","Luke Neilson","尼尔",0);
        _model.initCountryBaller("head_chipperfield","Sam Chipmunk","奇珀菲尔德");
        _model.initCountrys("body_australia","hand_australia","flag_australia",_model.getCountryBallers());
        //C组
        //flag_colombia
        _model.initCountryBaller("head_falco","Radamantis Falcon","法尔考",0);
        _model.initCountrys("body_colombia","hand_colombia","flag_colombia",_model.getCountryBallers());
        //flag_greece
        _model.initCountryBaller("head_karagounis","Karagon Unix","卡拉古尼斯",0);
        _model.initCountrys("body_greece","hand_greece","flag_greece",_model.getCountryBallers());
        //flag_cotedivoire
        _model.initCountryBaller("head_drogba","Daniel Dodo","德罗巴",0);
        _model.initCountrys("body_cotedivoire","hand_cotedivoire","flag_cotedivoire",_model.getCountryBallers());
        //flag_japan
        _model.initCountryBaller("head_honda","Keisuki Hyumdai","本田圭佑",0);
        _model.initCountryBaller("head_nakamura","Nightmare","中村俊辅");
        _model.initCountryBaller("head_nakata","Katana","中田英寿");
        _model.initCountrys("body_japan","hand_japan","flag_japan",_model.getCountryBallers());
        //  D组
        // flag_uruguay
        _model.initCountryBaller("head_cavani","Armany Edison","卡瓦尼",0);
        _model.initCountrys("body_uruguay","hand_uruguay","flag_uruguay",_model.getCountryBallers());
        //flag_costarica
        _model.initCountryBaller("head_ruiz","Bright Rus","鲁伊兹",0);
        _model.initCountrys("body_costarica","hand_costarica","flag_costarica",_model.getCountryBallers());
        //flag_england
        _model.initCountryBaller("head_rooney","Ray Wooly","鲁尼");
        _model.initCountryBaller("head_gerrard","Stanley Gere","杰拉德",0);
        _model.initCountryBaller("head_lampard","Fred Leopard","兰帕德");
        _model.initCountryBaller("head_beckham","Daniel Blackman","贝克汉姆");
        _model.initCountrys("body_england","hand_england","flag_england",_model.getCountryBallers());
        //flag_italy
        _model.initCountryBaller("head_pirlo","Andres Pimpo","皮尔洛",0);
        _model.initCountryBaller("head_balotelli","Marion Valloneta","巴洛特利");
        _model.initCountryBaller("head_buffon","Gian Clown","布冯");
        _model.initCountrys("body_italy","hand_italy","flag_italy",_model.getCountryBallers());
        //E组
        //flag_switzerland
        _model.initCountryBaller("head_barnetta","Quiet Baretta","巴内塔",0);
        _model.initCountrys("body_switzerland","hand_switzerland","flag_switzerland",_model.getCountryBallers());
        //flag_ecuador
        _model.initCountryBaller("head_caicedo","Felix Cacerio","凯塞多",0);
        _model.initCountrys("body_ecuador","hand_ecuador","flag_ecuador",_model.getCountryBallers());
        //flag_france
        _model.initCountryBaller("head_ribery","Fred Ribbon","里贝利");
        _model.initCountryBaller("head_giroud","Ollie Grand","吉鲁",0);
//        _model.initCountryBaller("head_zidane","zzz","齐达内");
        _model.initCountrys("body_france","hand_france","flag_france",_model.getCountryBallers());
        //flag_honduras
        _model.initCountryBaller("head_palacios","Willian Castillo","帕拉西奥斯",0);
        _model.initCountrys("body_honduras","hand_honduras","flag_honduras",_model.getCountryBallers());
        //F组
        //flag_argentina
        _model.initCountryBaller("head_messi","Larry Lion","梅西");
        _model.initCountryBaller("head_tevez","Charlie Television","特维斯",0);
        _model.initCountryBaller("head_maradona","Magdonaldona","马拉多纳");
        _model.initCountrys("body_argentina","hand_argentina","flag_argentina",_model.getCountryBallers());
        //flag_bosniaandherzegovina
        _model.initCountryBaller("head_dzeko","Erik Dsessoo","德泽科",0);
        _model.initCountrys("body_bosniaandherzegovina","hand_bosniaandherzegovina","flag_bosniaandherzegovina",_model.getCountryBallers());
        //flag_iran
        _model.initCountryBaller("head_nekounam","Java The HUD","内科南",0);
        _model.initCountrys("body_iran","hand_iran","flag_iran",_model.getCountryBallers());
        //flag_nigeria
        _model.initCountryBaller("head_mikel","John Obi Two","米克尔",0);
        _model.initCountrys("body_nigeria","hand_nigeria","flag_nigeria",_model.getCountryBallers());
        //G组
        //flag_germany
        _model.initCountryBaller("head_schweinsteiger","Schwemtagi","巴斯蒂安");
        _model.initCountryBaller("head_muller","Tom Mollar","穆勒",0);
        _model.initCountryBaller("head_kahn","Olive Kane","卡恩");
        _model.initCountryBaller("head_beckenbauer","Francis Breinbat","贝肯鲍尔");
        _model.initCountrys("body_germany","hand_germany","flag_germany",_model.getCountryBallers());
        //flag_portugal
        _model.initCountryBaller("head_ronaldo","Chris Rollo","c罗");
        _model.initCountryBaller("head_alves","Brian Alan","阿尔维斯",0);
        _model.initCountryBaller("head_figo","Zibbo","费戈");
        _model.initCountrys("body_portugal","hand_portugal","flag_portugal",_model.getCountryBallers());
        //flag_ghana
        _model.initCountryBaller("head_gyan","Again Asoma","阿萨莫阿",0);
        _model.initCountrys("body_ghana","hand_ghana","flag_ghana",_model.getCountryBallers());
        //flag_usa
        _model.initCountryBaller("head_dempsey","Clint East","邓普西",0);
        _model.initCountryBaller("head_donovan","Dann Landa","多诺万");
        _model.initCountrys("body_usa","hand_usa","flag_usa",_model.getCountryBallers());
        //H组
        //flag_belgium
        _model.initCountryBaller("head_fellaini","Mario Armanny","费莱尼",0);
        _model.initCountrys("body_belgium","hand_belgium","flag_belgium",_model.getCountryBallers());
        //flag_algeria
        _model.initCountryBaller("head_bougherra","Madhid Hoguera","布哥剌",0);
        _model.initCountrys("body_algeria","hand_algeria","flag_algeria",_model.getCountryBallers());
        //flag_russia
        _model.initCountryBaller("head_ignashevich","Server Inash","伊格纳舍维奇",0);
        _model.initCountryBaller("head_kokorin","Alexis Komodo","科科林");
        _model.initCountrys("body_russia","hand_russia","flag_russia",_model.getCountryBallers());
        //flag_korea
        _model.initCountryBaller("head_heugmin","Sony Hegeg","孙兴民",0);
        _model.initCountrys("body_korea","hand_korea","flag_korea",_model.getCountryBallers());
    }
}
