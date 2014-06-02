package fms;

import Math;
class AttackState extends BaseState{

/*
    public function new()
    {


    }*/

 /*   override public function enter():Void{


    }*/
    override public function excute(stateMachine:StateMachine):Void{
//    trace("state update^        ");
        super.excute(stateMachine);
        var dx:Float = stateMachine.ball.x-stateMachine.owner.x;

        if(dx < 0){
            stateMachine.owner.runToLeft();
        }else if(dx < Reg.BALL_EFFECTIVEDISTANCE ){
            stateMachine.owner.kick(stateMachine.ball);
        }else if(dx > Reg.BALL_EFFECTIVEDISTANCE ){
            stateMachine.owner.runToRight();
        }


    }
  /*  override public function exit():Void{


    }
*/

}
