package com.putaolab.football.footballer;
import com.putaolab.soccer.wiget.Wiget;
import flixel.util.FlxPoint;

/**
 * User: gaoyun
 * Date: 14-6-9
 * Time: 下午6:27
 * description：
 */

class PlayerRightHand  extends PlayerHand{
    public function new(X:Float = 0, Y:Float = 0,country:String="brazil") {
        super(X,X);
        flipX = true;
    }
}
