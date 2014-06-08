package;

import com.putaolab.football.ui.state.SelectTeamState;
import com.putaolab.football.ui.model.ModelReg;
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
    private var group:FlxSpriteGroup;

/**
	 * Function that is called up when to state is created to set it up. 
	 */
    override public function create():Void
    {
        Reg.BOUNDS = new FlxRect(126,0,FlxG.width-252,FlxG.height - Reg.TEERAIN_DEEP);
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



    /*初始化按钮*/
    private function initButton():Void
    {
        _oneplayer = new PTFlxUIButton(0,0,null);
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


        _twoplayer = new PTFlxUIButton(0,0,null);
        cursor.addWidget(_twoplayer);
        _twoplayer.params = ["twoplayer"];
        var twoplayer = AssetsManager.getInstance().getSprite(0,0,"btn_maly_bg1");
        var mainplayer = AssetsManager.getInstance().getSprite(0,0,"btn_iko_multiplayer");
        _twoplayer.loadGraphicsUpOverDown(twoplayer.getFlxFrameBitmapData());
        _twoplayer.x = (FlxG.width-_twoplayer.width)*0.5;
        _twoplayer.y = (FlxG.height-0)*0.5;
        mainplayer.x = (FlxG.width-_twoplayer.width)*0.5;
        mainplayer.y = (FlxG.height-0)*0.5;
        _twoplayer.scale.x = 0.8;
        _twoplayer.scale.y = 0.8;
        group.add(_twoplayer);
        group.add(mainplayer);

return;
        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"ball");
        add(sprite);
        sprite.x = sprite.y = 50;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"ball_aim");
        add(sprite);
        sprite.x = sprite.y = 100;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"ball_aim2");
        add(sprite);
        sprite.x = sprite.y = 150;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"ball_big");
        add(sprite);
        sprite.x = sprite.y = 200;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"ball_big_odlesk");
        add(sprite);
        sprite.x = sprite.y = 250;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"ball_odlesk");
        add(sprite);
        sprite.x = 300;
        sprite.y = 200;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"effect_ico_ball_grow");
        add(sprite);
        sprite.x = 400;
        sprite.y = 200;

        var sprite:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(sprite,"effect_ico_ball_shrink");
        add(sprite);
        sprite.x = 500;
        sprite.y = 200;


    }

    public override function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
//        trace(id + target + data + params);
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "oneplayer":
                            if(ModelReg.getTeamAndCountry()!=null){
                                trace(ModelReg.getTeamAndCountry()[0],ModelReg.getTeamAndCountry()[1]);
                                FlxG.switchState(new OnePlayerState());
                            }else{
                                FlxG.switchState(new SelectTeamState());
                            }
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
    }
}