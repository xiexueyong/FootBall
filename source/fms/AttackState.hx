package fms;

import Math;
class AttackState extends BaseState{

/*
    public function new()
    {


    }*/

   override public function enter():Void{

//        trace("进攻");
    }
    override public function excute(stateMachine:StateMachine):Void{
        super.excute(stateMachine);
        //进入攻击范围
        if(stateMachine.ball.x-stateMachine.owner.x > Reg.BALL_EFFECTIVEDISTANCE ){
            stateMachine.owner.runToRight();
        }

    }

    override public function exit():Void{
//        trace("——退出进攻");

    }

}
