package com.putaolab.soccer.charater;

import haxe.Timer;
import com.putaolab.soccer.wiget.Ball;
import fms.StateMachine;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;

class AIPlayer extends Player {
    public var stateMachine:StateMachine;

    public static var REST_MILLIONSECOND:Int = 400;

    public function new(X:Float = 0, Y:Float = 0,backDecorateGroup:FlxTypedGroup<FlxBasic>,frontDecorateGroup:FlxTypedGroup<FlxBasic>,name:String="carlos",country:String="brazil")
    {
        super(X, Y,backDecorateGroup,frontDecorateGroup,name,country);
        stateMachine = new StateMachine(this);
    }

    override public function update():Void{
        super.update();
    }
//    override public function kick(ball:Ball,?angle:Float):Void{
////        super.kick(ball,angle);
//
//        super.kick(ball,angle);
//    }



}
