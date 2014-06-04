
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class RightHand extends LeftHand {

    public function new(X:Float = 0, Y:Float = 0,country="brazil"):Void{
        super(X,Y,country);
        flipX = true;
    }

}
