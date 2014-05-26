package com.putaolad.soccer.charater;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Ball extends FlxSprite {
    public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:Dynamic)
    {
        super(X, Y);
        acceleration.y = 2000;
        drag.x = 1000;
        elasticity = 0.6;
        allowCollisions = FlxObject.ANY;
        mass = 1;
        makeGraphic(20,20,FlxColor.BLUE);

    }
    public function beKicked():Void{
        this.velocity.x = 3000;
        this.velocity.y = 2000;
    }
    private function spining():Void{
        if(velocity.x > 0){
            angularVelocity = 360;
        }else if(velocity.x < 0){
            angularVelocity = -360;
        }else{
            angularVelocity = 0;
        }
    }
    override public function update():Void{
        spining();
        super.update();
    }

}
