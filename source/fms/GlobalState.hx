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
        if(stateMachine.ball.y < stateMachine.owner.y && Math.abs(stateMachine.owner.x - stateMachine.ball.x)<100){
            stateMachine.owner.jump();
        }
        if(stateMachine.owner.y - stateMachine.ball.y >= 0 && stateMachine.ball.velocity.x < 0 && stateMachine.ball.x > stateMachine.owner.x){
            stateMachine.owner.runToLeft();
        }
        var dx:Float = stateMachine.ball.x-stateMachine.owner.x;
        if(dx < 0){
            stateMachine.owner.runToLeft();
        }
    }
    override public function exit():Void{
//        trace("退出globalstate。。。");

    }


}
