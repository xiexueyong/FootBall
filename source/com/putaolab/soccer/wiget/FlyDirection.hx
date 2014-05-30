
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class FlyDirection extends Wiget {
    public function new(X:Float = 0, Y:Float = 0){
        super(X,Y);
        AssetsManager.getInstance().uploadTextureToSprite(this,"ball_aim");
        origin.y = 63;

    }

}
