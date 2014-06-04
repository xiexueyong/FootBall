package fms;

import Math;
class DefendState extends BaseState{


  /*  public function new()
    {


    }*/

    override public function enter():Void{
//        trace("防守");
    }
    override public function excute(stateMachine:StateMachine):Void{
        if(stateMachine.opponent.x > stateMachine.owner.x && stateMachine.opponent.x - stateMachine.ball.x > stateMachine.ball.x -  stateMachine.owner.x){
            stateMachine.owner.runToLeft();
        }else{
            stateMachine.owner.stop();
        }



    }
    override public function exit():Void{
//        trace("退出防守。。。");

    }


}
