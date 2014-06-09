package com.putaolab.football.ui.state;
import component.PTFlxUISubState;
import flixel.addons.ui.FlxUICursor;

/**
 * User: gaoyun
 * Date: 14-6-5
 * Time: 下午4:41
 * description：
 */

class AllPopState extends PTFlxUISubState{
    public function new() {
        super();
    }

    public override function create():Void
    {
        _makeCursor = true;

        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);
        init();

    }

    private function init():Void{

    }

}
