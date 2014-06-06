package com.putaolab.soccer.charater;
import flixel.util.FlxRect;
import com.putaolab.soccer.wiget.LeftHand;
import com.putaolab.soccer.wiget.RightHand;
import com.putaolab.soccer.wiget.Head;
import com.putaolab.soccer.wiget.Body;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;
import Reg;
import com.putaolab.soccer.wiget.Ball;
import flixel.FlxObject;
import flixel.FlxSprite;
class BoundsSprite extends FlxSprite {

    public var collisionMap:FlxRect;
    public var maxBounds:FlxRect;

    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);
    }

    public function setBoundsMap(boundsMap:FlxRect) {
        maxBounds = boundsMap;
    }
    private function checkBoundsMap():Void
    {
        if (maxBounds == null) {
            return;
        }

        if (x + collisionMap.x < maxBounds.x)
        {
            x = maxBounds.x - collisionMap.x;
            acceleration.x = 0;
            velocity.x = 500;
        }
        else if ((x + collisionMap.x + collisionMap.width) > (maxBounds.x + maxBounds.width))
        {
            x = (maxBounds.x + maxBounds.width) - collisionMap.width - collisionMap.x;
            acceleration.x = 0;
            velocity.x = -500;
        }

        if (y + collisionMap.y < maxBounds.y)
        {
//            y = maxBounds.y - collisionMap.y;
//            acceleration.y = 0;
        }
        else if ((y + collisionMap.y + collisionMap.height) > (maxBounds.y + maxBounds.height))
        {
            y = (maxBounds.y + maxBounds.height) - collisionMap.height - collisionMap.y;
//            acceleration.y = Reg.PLAYER_GRAVITY;
//            acceleration.y = 0;
        }
    }

    override public function update():Void{
        checkBoundsMap();
        super.update();
    }


}
