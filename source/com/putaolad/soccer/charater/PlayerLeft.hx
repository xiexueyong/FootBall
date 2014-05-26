package com.putaolad.soccer.charater;
import Float;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class PlayerLeft extends Player {
    public var controllable:Bool;
    public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:Dynamic)
    {
        super(X, Y);
        acceleration.y = 2000;
        drag.x = 1000;
//        maxVelocity.y = 200;
        maxVelocity.x = 600;
        elasticity = 0.6;
        mass = 3;
        allowCollisions = FlxObject.ANY;
        makeGraphic(20,50,FlxColor.BLUE);
    }

    public function jump():Void{
        velocity.y = -1000;
    }
    public function runToLeft():Void{
        acceleration.x = -1000;
    }
    public function runToRight():Void{
        acceleration.x = 1000;
    }
    public function stop():Void{
        acceleration.x = 0;
    }
    public function kick(ball:Ball):Void{
        var tx:Float = ball.x - this.x;
        if(facing == FlxObject.RIGHT){

        }

        if(ball){

        }
        ball.beKicked();
    }

    override public function update():Void{
        super.update();
    }


}
