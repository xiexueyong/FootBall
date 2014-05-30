
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class LeftFlyDirection extends FlyDirection {

    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);
        offsetOnParent = new FlxPoint(-12,-43);
//        origin.y = 63;
//        origin.y = 10;
    }

  /*  override public function update():Void{
        super.update();
    }*/

}
