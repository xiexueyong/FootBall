
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Wiget extends FlxSprite {

    public var offsetOnParent:FlxPoint;
    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);
        makeGraphic(100,20,FlxColor.RED);

    }
    override private function set_x(NewX:Float):Float{
        if(offsetOnParent == null){
            offsetOnParent = new FlxPoint(0,0);
        }
        return super.set_x(NewX+offsetOnParent.x);
    }

    override private function set_y(NewY:Float):Float
    {
        if(offsetOnParent == null){
            offsetOnParent = new FlxPoint(0,0);
        }
        return super.set_y(NewY+offsetOnParent.y);
    }


  /*  override public function update():Void{
        super.update();
    }*/

}
