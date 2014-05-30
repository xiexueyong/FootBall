package component;

import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.interfaces.ICursorPointable;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.addons.ui.interfaces.IFlxUIClickable;
import flixel.addons.ui.interfaces.IHasParams;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
/**
 * @author Lars Doucet
 * 1.添加widgets    get接口，在外部刷新节点时用到
  * 2.override _sortXY方法
  * 3.override addWidget  removeWidget方法
  * 4.if （widget.active/visible == false）,cursor跳过
 */


class PTFlxUICursor extends FlxUICursor
{
    public var widgets(get,null):Array<IFlxUIWidget>;
/*    public function new()
    {

    }*/

    public function get_widgets():Array<IFlxUIWidget>{
        return _widgets;
    }

    override private function _doInput(X:Int, Y:Int):Void {
        super._doInput(X,Y);

        if(!_widgets[location].active || !_widgets[location].visible){
            _doInput(X,Y);
        }
    }

 /*   override public function addWidget(widget:IFlxUIWidget):Void
    {
        if (Std.is(widget, ICursorPointable))			//directly pointable? add it
        {
            _widgets.push(widget);
        }
        else if (Std.is(widget, FlxUIGroup))			//it's a group?
        {
            var g:FlxUIGroup = cast widget;
            for (member in g.members)
            {
                if (Std.is(member, IFlxUIWidget))
                {
                    addWidget(cast member);					//add each member individually
                }
            }
        }
        _widgets.sort(_sortXY);
    }*/

   /* override public function removeWidget(widget:IFlxUIWidget):Bool{
        var value:Bool = false;
        if (_widgets != null) {
            if (_widgets.indexOf(widget) != -1) {
                value = _widgets.remove(widget);
                _widgets.sort(_sortXY);
            }
        }
        return value;
    }*/

/*    override private function _sortXY(a:IFlxUIWidget, b:IFlxUIWidget):Int {
        if (a.y + a.height/2 < b.y + b.height/2 ) return -1;
        if (a.y + a.height/2 > b.y + b.height/2) return 1;
        if (a.x + a.width/2< b.x + b.width/2) return -1;
        if (a.x + a.width/2> b.x + b.width/2) return 1;
        return 0;
    }*/

}