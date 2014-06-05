package fms;

import Math;
class DefendState extends BaseState{


  /*  public function new()
    {


    }*/

    override public function enter():Void{
        trace("防守");
    }
    override public function excute(stateMachine:StateMachine):Void{
//        if(stateMachine.opponent.x > stateMachine.owner.x && stateMachine.opponent.x - stateMachine.ball.x > stateMachine.ball.x -  stateMachine.owner.x){
//            stateMachine.owner.runToLeft();
//        }else{
//            stateMachine.owner.stop();
//        }


        //后退接头球
        //60 = stateMachine.owner.height/2
        //-100, 球向左飞行的速度
        if(stateMachine.owner.x > 210){

            if(stateMachine.ball.y <= Reg.BOUNDS.height-60 && stateMachine.ball.velocity.x < -200 && stateMachine.ball.velocity.y < 0 && stateMachine.owner.x > 80){
                stateMachine.owner.runToLeft();
            }else if(stateMachine.opponent.x > stateMachine.owner.x && stateMachine.ball.x > stateMachine.owner.x && stateMachine.opponent.x - stateMachine.ball.x < stateMachine.ball.x -  stateMachine.owner.x - 100){
    //防止对方吊球
                stateMachine.owner.runToLeft();
            }
        }else{
            stateMachine.owner.stop();
        }




    }
    override public function exit():Void{
        trace("————退出防守");

    }


}
