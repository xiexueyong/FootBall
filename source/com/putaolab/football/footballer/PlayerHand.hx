package com.putaolab.football.footballer;
import com.putaolab.soccer.wiget.Wiget;
import flixel.util.FlxPoint;

/**
 * User: gaoyun
 * Date: 14-6-9
 * Time: 下午6:12
 * description：
 */


class PlayerHand extends Wiget{
    public function new(X:Float = 0, Y:Float = 0,country:String="brazil") {
        super(X,Y);
        offsetOnParent = new FlxPoint(-1,73);
        AssetsManager.getInstance().uploadTextureToSprite(this,"hand_"+country);
    }
}
