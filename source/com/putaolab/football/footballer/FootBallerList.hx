package com.putaolab.football.footballer;
import component.PTFlxUIList;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.util.FlxPoint;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.addons.ui.interfaces.IFlxUIButton;
import flixel.addons.ui.FlxUICursor;

/**
 * User: gaoyun
 * Date: 14-5-27
 * Time: 下午4:44
 * description：
 */
class FootBallerList extends PTFlxUIList{
    public function new(X:Float=0,Y:Float=0,?Widgets:Array<IFlxUIWidget>=null,W:Float=0,H:Float=0,?MoreString:String="<X> more...",?Stacking:Int=FlxUIList.STACK_VERTICAL,?Spacing:Float=0,PrevButtonOffset:FlxPoint=null,NextButtonOffset:FlxPoint=null,PrevButton:IFlxUIButton=null,NextButton:IFlxUIButton=null,CurrentCursor:FlxUICursor)
    {
        cursor =cast CurrentCursor;
        super(X,Y,Widgets,W,H,MoreString,Stacking,Spacing,PrevButtonOffset,NextButtonOffset,PrevButton,NextButton);
    }
}
