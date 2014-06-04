package com.putaolab.soccer.charater;

import fms.StateMachine;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;

class AIPlayer extends Player {
    public var stateMachine:StateMachine;

    public function new(X:Float = 0, Y:Float = 0,parent:FlxTypedGroup<FlxBasic>,name:String="carlos",country:String="brazil")
    {
        super(X, Y,parent,name,country);
        stateMachine = new StateMachine(this);
    }

    override public function update():Void{
        super.update();
    }


}
