
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class RightFlyDirection extends FlyDirection {

    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);
        offsetOnParent = new FlxPoint(15,-76);
//        origin.x = 0;
    }

  /*  override public function update():Void{
        super.update();
    }*/

}
