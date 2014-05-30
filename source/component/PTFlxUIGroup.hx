package component;

import flixel.addons.ui.FlxUIGroup;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.interfaces.IFlxUIClickable;
import flixel.addons.ui.interfaces.IHasParams;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
/**
 * @author Lars Doucet
 */
class PTFlxUIGroup extends FlxUIGroup implements IFlxUIClickable implements IHasParams
{

    public var button:FlxUIButton;
    public var params(default, set):Array<Dynamic>;
    public var skipButtonUpdate(default, set):Bool = false;
    public var callback:Void->Void;

    public static inline var CLICK_EVENT:String = "click_PTFlxUIGroup";

    private function set_skipButtonUpdate(b:Bool):Bool {
        skipButtonUpdate = b;
        button.skipButtonUpdate = skipButtonUpdate;
        return skipButtonUpdate;
    }
    private function set_params(p:Array <Dynamic>):Array<Dynamic>{
        params = p;
        if (params == null)
        {
            params = [];
        }
        return params;
    }

    public function new(X:Float = 0, Y:Float = 0 ?Params:Array<Dynamic>，?Callback:Void->Void)
    {
        super();

        callback = Callback;
        params = Params;
        button = new FlxUIButton(0, 0, null, _clickCheck);

        //set default checkbox label format
        button.up_color = 0xffffff;
        button.down_color = 0xffffff;
        button.over_color = 0xffffff;
        button.up_toggle_color = 0xffffff;
        button.down_toggle_color = 0xffffff;
        button.over_toggle_color = 0xffffff;

//        button.loadGraphicsUpOverDown();
        button.onUp.callback = _clickCheck;    //for internal use, check/uncheck box, bubbles up to _externalCallback
        add(button);
//set all these to 0
        button.labelOffsets[FlxButton.NORMAL].x = 0;
        button.labelOffsets[FlxButton.NORMAL].y = 0;
        button.labelOffsets[FlxButton.PRESSED].x = 0;
        button.labelOffsets[FlxButton.PRESSED].y = 0;
        button.labelOffsets[FlxButton.HIGHLIGHT].x = 0;
        button.labelOffsets[FlxButton.HIGHLIGHT].y = 0;

        x = X;
        y = Y;
    }

    private override function set_visible(Value:Bool):Bool
    {
//don't cascade to my members
        visible = Value;
        return visible;
    }

    public override function destroy():Void
    {
        super.destroy();
        if (button != null) {
            button.destroy();
            button = null;
        }
    }

    public override function update():Void{
        super.update();
////更新按钮的宽高
//        if (_dirty) {
//            button.width = ?;
//            _dirty = false;
//        }
    }

/*****PRIVATE******/

    private function _clickCheck():Void
    {
        checked = !checked;
        if (callback != null) {
            callback();
        }
        if(broadcastToFlxUI){
            FlxUI.event(CLICK_EVENT, this, checked, params);
        }
    }

}