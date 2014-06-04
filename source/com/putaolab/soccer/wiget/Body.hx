
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Body extends Wiget {

    public function new(X:Float = 0, Y:Float = 0,country:String):Void{
        super(X,Y);
        offsetOnParent = new FlxPoint(17,96);
        AssetsManager.getInstance().uploadTextureToSprite(this,"body_"+country);

    }

}
