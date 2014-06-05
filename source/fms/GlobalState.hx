package fms;

import Math;
class GlobalState extends BaseState{


  /*  public function new()
    {


    }*/

    override public function enter():Void{
//        trace("global");
    }
    override public function excute(stateMachine:StateMachine):Void{
        //头球
        if(stateMachine.ball.y < stateMachine.owner.y && Math.abs(stateMachine.ball.x - stateMachine.owner.x)<200){
            stateMachine.owner.jump();
        }
        //踢球
        var dx:Float = stateMachine.ball.x - stateMachine.owner.x;
        if(dx < Reg.BALL_EFFECTIVEDISTANCE && dx > 0 ){
            stateMachine.owner.kick(stateMachine.ball,stateMachine.getBestKickAngle());
        }

        //回到球的后面
        if(stateMachine.owner.x >= stateMachine.ball.x){
            stateMachine.owner.runToLeft();
        }
    }
    override public function exit():Void{
//        trace("退出globalstate。。。");

    }


}
