package fms;

import Math;
class AttackState extends BaseState{

/*
    public function new()
    {


    }*/

   override public function enter():Void{

        trace("进攻");
    }
    override public function excute(stateMachine:StateMachine):Void{
        super.excute(stateMachine);
        var dx:Float = stateMachine.ball.x-stateMachine.owner.x;

        if(dx < Reg.BALL_EFFECTIVEDISTANCE ){
            stateMachine.owner.kick(stateMachine.ball,stateMachine.getBestKickAngle());
        }else if(dx > Reg.BALL_EFFECTIVEDISTANCE ){
            stateMachine.owner.runToRight();
        }
    }

    override public function exit():Void{
        trace("——退出进攻");

    }

}
