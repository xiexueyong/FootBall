package;

import com.putaolab.football.ui.state.StateBG;
import com.putaolab.football.ui.state.OnePlayerState;
import com.putaolab.football.ui.state.TwoPlayerState;
import flixel.FlxG;
import flixel.FlxSprite;
import component.PTFlxUIButton;
import component.PTFlxUIState;
import flixel.FlxSprite;
import flixel.util.FlxRect;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.group.FlxSpriteGroup;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends PTFlxUIState
{
    private var _oneplayer:FlxUIButton ;
    private var _twoplayer:FlxUIButton ;
    private var _sound:FlxUIButton;
    private var _shop:FlxUIButton;
    private var _cloudarr:Array<FlxSprite>;
    private var group:FlxSpriteGroup;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
        Reg.BOUNDS = new FlxRect(0,0,FlxG.width,FlxG.height - Reg.TEERAIN_DEEP);
        _makeCursor = true;
        group = new FlxSpriteGroup();
        add(group);
        group.y = 10;

        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);
        init();

//        var sp = AssetsManager.getInstance().getSprite(200,200,"bg_mrak2");
//        var sp = AssetsManager.getInstance().getAnimation(200,200,"giroud","bg_tribuna_people",15);
//        sp.animation.play("giroud");
//        add(sp);
	}


    public function init():Void
    {
        group.add(new StateBG());
        initButton();
    }

    /*创建漂浮的云*/
    private function cloudFly(add:Int=0):Void
    {
        var random = 1+Math.random()*4;
        var cloud = AssetsManager.getInstance().getSprite(0,0,"bg_mrak"+Math.floor(random));
        if(add==1){
            cloud.x = FlxG.width+50;
        }else{
            cloud.x = Math.random()*FlxG.width;
        }
        cloud.y = Math.random()*FlxG.height*0.1;
        cloud.ID = Math.round(random);
        group.add(cloud);
        _cloudarr.push(cloud);
        if(Math.round(random) == 1){
            cloud.velocity.x =Reg.cloudspeed1;
        }
        if(Math.round(random) == 2){
            cloud.velocity.x =Reg.cloudspeed2;
        }
        if(Math.round(random) == 3){
            cloud.velocity.x =Reg.cloudspeed3;
        }
        if(Math.round(random) == 4){
            cloud.velocity.x =Reg.cloudspeed4;
        }
        if(Math.round(random) == 5){
            cloud.velocity.x =Reg.cloudspeed5;
        }
    }


    /*移动云彩和创建云彩*/
    private function moveAndCreateCloud():Void{
        if(_cloudarr == null){
            _cloudarr = new Array<FlxSprite>();
        }
        var len = _cloudarr.length;
        for(i in 0...len){
            if(_cloudarr[i].x< -_cloudarr[i].width){
                _cloudarr.splice(i,1);
                cloudFly(1);
            }
        }
        if(len < 5){
            cloudFly(0);
        }
    }


    /*初始化按钮*/
    private function initButton():Void
    {
        _oneplayer = new PTFlxUIButton(400,230,null);
        cursor.addWidget(_oneplayer);
        _oneplayer.params = ["oneplayer"];
        var oneplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var playicon = AssetsManager.getInstance().getSprite(0,0,"btn_iko_play");
        _oneplayer.loadGraphicsUpOverDown(oneplayer.getFlxFrameBitmapData());
        _oneplayer.x = (FlxG.width-_oneplayer.width)*0.5;
        _oneplayer.y = (FlxG.height-200)*0.5;
        playicon.x = (FlxG.width-_oneplayer.width)*0.5;
        playicon.y = (FlxG.height-200)*0.5;
        group.add(_oneplayer);
        group.add(playicon);


        _twoplayer = new PTFlxUIButton(400,300,null);
        cursor.addWidget(_twoplayer);
        _twoplayer.params = ["twoplayer"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var mainplayer = AssetsManager.getInstance().getSprite(0,0,"btn_iko_multiplayer");
        _twoplayer.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _twoplayer.x = (FlxG.width-_twoplayer.width)*0.5;
        _twoplayer.y = (FlxG.height-50)*0.5;
        mainplayer.x = (FlxG.width-_twoplayer.width)*0.5;
        mainplayer.y = (FlxG.height-50)*0.5;
        _twoplayer.scale.x = 0.8;
        _twoplayer.scale.y = 0.8;
        group.add(_twoplayer);
        group.add(mainplayer);
    }

    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
//        trace(id + target + data + params);
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "oneplayer":
//                            trace("oneplayer");
                            FlxG.switchState(new OnePlayerState());
                        case "twoplayer":
                            FlxG.switchState(new TwoPlayerState());
//                            trace("twoplayer");
                    }
            }
        }
    }


	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
    override public function destroy():Void
    {
        super.destroy();
    }

    /**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
        moveAndCreateCloud();
	}	
}