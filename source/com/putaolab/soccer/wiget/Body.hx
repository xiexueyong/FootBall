
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Body extends Wiget {

    public function new(X:Float = 0, Y:Float = 0):Void{
        super(X,Y);
        offsetOnParent = new FlxPoint(10,68);
        AssetsManager.getInstance().uploadTextureToSprite(this,"body_france");

    }

}
